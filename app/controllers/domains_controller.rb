class DomainsController < ApplicationController
  load_and_authorize_resource
  before_action :display_values, only: [:show]
  before_action :load_domainable, only: [:new,:create]


  def new
    Rails.logger.info "test3"
    @domain = @domainable.domains.new
  end

  def index
    @domains = Domain.all
  end

  def create     
    var = 0
    @domainable.domains.each do |dom|
      if dom.type_modality == "Creacion de empresa"
        var += dom.percentage
      end  
    end
    
    if params[:domain][:type_modality] == "Compra y Venta de acciones"
      c = params[:vendedor]
      if c.chars[c.length - 1] == "N"
        legal = LegalPersona.find(params[:legal_persona_id])
        member = PersonaMember.where(persona_id: c.split("N")[0].to_i, type_member: "Natural", legal_persona_id: params[:legal_persona_id])
        Rails.logger.info member[0].acciones
        nueva_accion = member[0].acciones.to_i - params[:domain][:price].to_i
        nuevo_porcentaje = (nueva_accion * 100)/legal.acciones 
        member.update(acciones: nueva_accion, percentage: nuevo_porcentaje.round(2))
        Rails.logger.info member[0].acciones
        @domain = @domainable.domains.new(domain_params)
        
        if @domain.save
          DomainRol.create(type_member: 'Natural', type_rol: 'Vendedor', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
          redirect_to @domainable, notice: "Dominio añadido!"
        end    
      else
        legal = LegalPersona.find(params[:legal_persona_id])
        member = PersonaMember.where(persona_id: c.split("L")[0].to_i, type_member: "Legal", legal_persona_id: params[:legal_persona_id])
        Rails.logger.info member[0].acciones
        nueva_accion = member[0].acciones.to_i - params[:domain][:price].to_i
        nuevo_porcentaje = (nueva_accion * 100)/legal.acciones 
        member.update(acciones: nueva_accion, percentage: nuevo_porcentaje.round(2))
        Rails.logger.info member[0].acciones
        @domain = @domainable.domains.new(domain_params)
        if @domain.save
          DomainRol.create(type_member: 'Legal', type_rol: 'Vendedor', persona_id: c.split("L")[0].to_i, domain_id: @domain.id)
          redirect_to @domainable, notice: "Dominio añadido!"
        end
        
      end
    else
      if (var + (params[:domain][:percentage]).to_i ) <= 100
        Rails.logger.info "var <= 100"
        
        @domain = @domainable.domains.new(domain_params)
        if @domain.save
          c = params[:vendedor]
          if c.chars[c.length - 1] == "N"
            if @domain.type_modality == "Creacion de empresa"
              DomainRol.create(type_member: 'Natural', type_rol: 'Creador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
              PersonaMember.create(legal_persona_id: @domain.domainable_id, percentage: @domain.percentage.round(2), type_member: 'Natural', persona_id: c.split("N")[0].to_i, acciones: @domain.price)
            end                
            if @domain.type_modality == "Modificacion de empresa"
              DomainRol.create(type_member: 'Natural', type_rol: 'Modificador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
            end
          else
            if @domain.type_modality == "Creacion de empresa"
              DomainRol.create(type_member: 'Legal', type_rol: 'Creador', persona_id: c.split("L")[0].to_i, domain_id: @domain.id)
              PersonaMember.create(legal_persona_id: @domain.domainable_id, percentage: @domain.percentage.round(2), type_member: 'Legal', persona_id: c.split("N")[0].to_i, acciones: @domain.price)
            end  
            if @domain.type_modality == "Modificacion de empresa"
              DomainRol.create(type_member: 'Legal', type_rol: 'Modificador', persona_id: c.split("L")[0].to_i, domain_id: @domain.id)
            end
         
          end     
        redirect_to @domainable, notice: "Dominio añadido!"
        else
          flash[:errors] = @domain.errors.full_messages
          redirect_to @domainable
        end
      else
        flash[:alert] = "El porcentaje de participacion excede el 100%"
        redirect_to @domainable      
      end
    end    
  end

  
  def update
    @domain.update(domain_params)
    Rails.logger.info "actualizado"
    redirect_to domain_path
  end  

  def edit
    Rails.logger.info "test1"
    @domain = Domain.find(params[:id])
  end

  def show

  end

  def destroy
    @domain = Domain.find(params[:id])
    @legalpersona = LegalPersona.find(@domain.domainable_id)
    DomainRol.order(:id).each do |domrol|
      if domrol.domain_id == @domain.id
        if @domain.type_modality == "Compra y Venta de acciones"
          member = PersonaMember.where(persona_id: domrol.persona_id, type_member: domrol.type_member)
          acciones = @domain.price.to_i + member[0].acciones.to_i
          member[0].update(acciones: acciones)
          domrol.destroy
        else
          domrol.destroy  
        end
      end  
    end    
    @domain.destroy
    redirect_to @legalpersona

  end

  def list_domain
    begin
      @domain = Domain.where(type_modality: "Creacion de empresa", domainable_id: params[:domainable_id])  
    rescue => exception
      Rails.logger.info exception.to_s
    end
    
  end

private
  def display_values
    @able = @domain
    @type_modality = @able.type_modality
    @price = @able.price
    @date_posetion = @able.date_posetion
    @percentage = @able.percentage 
  end


  def domain_params
    params.require(:domain).permit(:type_modality,:inscription_id,:price,:date_posetion,:percentage, :notario_id)
  end

  def load_domainable
    klass = [LegalPersona].detect { |c| params["#{c.name.underscore}_id"]}
    @domainable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
