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
      var += dom.percentage
    end

    if (var + (params[:domain][:percentage]).to_i ) <= 100
      Rails.logger.info "var <= 100"
      @domain = @domainable.domains.new(domain_params)
      if @domain.save
        
        params[:vendedor].each do |c|
          if c.chars[c.length - 1] == "N"
            if @domain.type_modality == "Creacion de empresa"
              DomainRol.create(type_member: 'Natural', type_rol: 'Creador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)              
            elsif @domain.type_modality == "Modificacion de empresa"
              DomainRol.create(type_member: 'Natural', type_rol: 'Modificador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
            else
              DomainRol.create(type_member: 'Natural', type_rol: 'Vendedor', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
            end  
          else
            if @domain.type_modality == "Creacion de empresa"
              DomainRol.create(type_member: 'Legal', type_rol: 'Creador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
            elsif @domain.type_modality == "Modificacion de empresa"
              DomainRol.create(type_member: 'Legal', type_rol: 'Modificador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
            else
              DomainRol.create(type_member: 'Legal', type_rol: 'Vendedor', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
            end      
          end    
        end  
        redirect_to @domainable, notice: "Dominio añadido!"
      else
        flash[:errors] = @domains.errors.full_messages
        redirect_to @domainable
      end
    else
      flash[:alert] = "El porcentaje de participacion excede el 100%"
      redirect_to @domainable      
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
    @domain.destroy
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
