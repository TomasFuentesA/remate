class DomainsController < ApplicationController
  load_and_authorize_resource
  before_action :display_values, only: [:show]
  before_action :load_domainable, only: [:new,:create]


  def new
    Rails.logger.info params
    @legal_persona_id = params['legal_persona_id']
    @domain_data = Domain.find(@legal_persona_id) rescue nil
    @type_modality= @domain_data != nil ? @domain_data.type_modality : ""
    @flag = @type_modality=="Creacion de empresa" ? true : false
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
    
    if params[:domain][:type_modality] == "Compra y Venta de acciones" then
      c = params[:vendedor]
      if c.chars[c.length - 1] == "N"
        legal = LegalPersona.find(params[:legal_persona_id])
        member = PersonaMember.where(persona_id: c.split("N")[0].to_i, type_member: "Natural", legal_persona_id: params[:legal_persona_id])
        nueva_accion = member[0].acciones.to_i - params[:domain][:price].to_i
        Rails.logger.info nueva_accion
        if nueva_accion < 0
          flash[:alert] = "Insuficientes acciones para vender"
          redirect_to new_legal_persona_domain_path(legal)
        else
          nuevo_porcentaje = member[0].percentage - params[:domain][:percentage].to_f
          member.update(acciones: nueva_accion, percentage: nuevo_porcentaje, capital_actual: member[0].capital_actual + params[:domain][:valor].to_i)
          if member[0].acciones == 0
            Historico.create(persona_id: member[0].persona_id, legal_persona_id: member[0].legal_persona_id ,type_member: member[0].type_member, entrada: member[0].entrada, salida: params[:domain][:date_posetion], acciones: params[:domain][:price], valor: member[0].capital_actual )
            member[0].destroy
          end
          @domain = @domainable.domains.new(domain_params)
          
          if @domain.save
            DomainRol.create(type_member: 'Natural', type_rol: 'Vendedor', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
            redirect_to @domainable, notice: "Dominio añadido!"
          end
        end      
      else
        legal = LegalPersona.find(params[:legal_persona_id])
        member = PersonaMember.where(persona_id: c.split("L")[0].to_i, type_member: "Legal", legal_persona_id: params[:legal_persona_id])
        nueva_accion = member[0].acciones.to_i - params[:domain][:price].to_i
        if nueva_accion < 0
          flash[:alert] = "Escoja otro vendedor, insuficientes acciones"
          redirect_to new_legal_persona_domain_path(legal)
        else 
          nuevo_porcentaje = member[0].percentage - params[:domain][:percentage].to_f
          member.update(acciones: nueva_accion, percentage: nuevo_porcentaje, capital_actual: member[0].capital_actual + params[:domain][:valor].to_i)
          if member[0].acciones == 0
            Historico.create(persona_id: member[0].persona_id, legal_persona_id: member[0].legal_persona_id ,type_member: member[0].type_member, entrada: member[0].entrada, salida: params[:domain][:date_posetion], acciones: params[:domain][:price], valor: params[:domain][:valor])
            member[0].destroy
          end
          @domain = @domainable.domains.new(domain_params)
          if @domain.save
            DomainRol.create(type_member: 'Legal', type_rol: 'Vendedor', persona_id: c.split("L")[0].to_i, domain_id: @domain.id)
            redirect_to @domainable, notice: "Dominio añadido!"
          end
        end  
      end
    elsif params[:domain][:type_modality] == "Modificacion de empresa" then
      params[:domain][:percentage] = 0
      params[:domain][:price] = 0
      if (var + (params[:domain][:percentage]).to_i ) <= 100
        @domain = @domainable.domains.new(domain_params)
        if @domain.save
          c = params[:vendedor]
          if c.chars[c.length - 1] == "N"                
            DomainRol.create(type_member: 'Natural', type_rol: 'Modificador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)     
          else 
            DomainRol.create(type_member: 'Legal', type_rol: 'Modificador', persona_id: c.split("L")[0].to_i, domain_id: @domain.id)         
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
    else
      Rails.logger.info params
      c = params[:vendedor]
      if c.chars[c.length - 1] == "N"
        Rails.logger.info "Es Natural"
        member = PersonaMember.where(persona_id: c.chars[0].to_i, type_member: "Natural", legal_persona_id: params[:legal_persona_id])
        if member.length == 0
          @legalpersona = LegalPersona.find(params[:legal_persona_id])
          @legalpersona.update(acciones: (@legalpersona.acciones + params[:domain][:price].to_i), total: (@legalpersona.total + params[:domain][:valor].to_i ))
          porcentaje = (params[:domain][:price].to_i * 100).to_f/@legalpersona.acciones
          PersonaMember.create(legal_persona_id: @legalpersona.id, percentage: porcentaje.to_f.round(2), type_member: "Natural", persona_id: c.chars[0].to_i, acciones: params[:domain][:price].to_i, entrada: params[:domain][:date_posetion], capital_actual: -params[:domain][:valor].to_i)
          @actuales = PersonaMember.where(legal_persona_id: @legalpersona.id)
          @actuales.each do |actual|
            if actual.id != member[0].id
              nuevo_porcentaje = (actual.acciones * 100).to_f/@legalpersona.acciones
              actual.update(percentage: nuevo_porcentaje.round(2))
            end 
          end
          @domain = Domain.create(type_modality: params[:domain][:type_modality], price: params[:domain][:price].to_i, date_posetion: params[:domain][:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:domain][:percentage].to_f, notario_id: params[:domain][:notario_id], valor: params[:domain][:valor].to_i) 
          DomainRol.create(type_member: 'Natural', type_rol: 'Aumentador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
          Rails.logger.info "No existe"
          redirect_to legalpersona
        else
          @legalpersona = LegalPersona.find(params[:legal_persona_id])
          nueva_accion = @legalpersona.acciones + params[:domain][:price].to_i
          nuevo_total = @legalpersona.total + params[:domain][:valor].to_i
          @legalpersona.update(acciones: nueva_accion, total: nuevo_total)
          nueva_accion = member[0].acciones + params[:domain][:price].to_i 
          member[0].update(acciones: nueva_accion, percentage: ((nueva_accion*100)/@legalpersona.acciones).to_f, capital_actual: member[0].capital_actual - params[:domain][:valor].to_i)
          @actuales = PersonaMember.where(legal_persona_id: @legalpersona.id)
          @actuales.each do |actual|
            if actual.id != member[0].id
              nuevo_porcentaje = (actual.acciones * 100).to_f/@legalpersona.acciones
              actual.update(percentage: nuevo_porcentaje.round(2))
            end 
          end
          @domain = Domain.create(type_modality: params[:domain][:type_modality], price: params[:domain][:price].to_i, date_posetion: params[:domain][:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:domain][:percentage].to_f, notario_id: params[:domain][:notario_id], valor: params[:domain][:valor].to_i) 
          DomainRol.create(type_member: 'Natural', type_rol: 'Aumentador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
          redirect_to @legalpersona
        end
      else
        Rails.logger.info "Es Legal"
        member = PersonaMember.where(persona_id: c.chars[0].to_i, type_member: "Legal", legal_persona_id: params[:legal_persona_id])
        if member.length == 0
          @legalpersona = LegalPersona.find(params[:legal_persona_id])
          @legalpersona.update(acciones: (@legalpersona.acciones + params[:domain][:price].to_i), total: (@legalpersona.total + params[:domain][:valor].to_i ))
          porcentaje = (params[:domain][:price].to_i * 100).to_f/@legalpersona.acciones
          PersonaMember.create(legal_persona_id: @legalpersona.id, percentage: porcentaje.to_f.round(2), type_member: "Legal", persona_id: c.chars[0].to_i, acciones: params[:domain][:price].to_i, entrada: params[:domain][:date_posetion], capital_actual: -params[:domain][:valor].to_i )
          @actuales = PersonaMember.where(legal_persona_id: @legalpersona.id)
          @actuales.each do |actual|
            nuevo_porcentaje = (actual.acciones * 100).to_f/@legalpersona.acciones
            actual.update(percentage: nuevo_porcentaje.round(2))
          end 
          @domain = Domain.create(type_modality: params[:domain][:type_modality], price: params[:domain][:price].to_i, date_posetion: params[:domain][:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:domain][:percentage].to_f, notario_id: params[:domain][:notario_id], valor: params[:domain][:valor].to_i) 
          DomainRol.create(type_member: 'Legal', type_rol: 'Aumentador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
          Rails.logger.info "No existe"
          redirect_to legalpersona
        else
          @legalpersona = LegalPersona.find(params[:legal_persona_id])
          nueva_accion = @legalpersona.acciones + params[:domain][:price].to_i
          nuevo_total = @legalpersona.total + params[:domain][:valor].to_i
          @legalpersona.update(acciones: nueva_accion, total: nuevo_total)
          nueva_accion = member[0].acciones + params[:domain][:price].to_i 
          member[0].update(acciones: nueva_accion, percentage: ((nueva_accion*100)/@legalpersona.acciones).to_f, capital_actual: member[0].capital_actual - params[:domain][:valor].to_i)
          @actuales = PersonaMember.where(legal_persona_id: @legalpersona.id)
          @actuales.each do |actual|
            if actual.id != member[0].id
              nuevo_porcentaje = (actual.acciones * 100).to_f/@legalpersona.acciones
              actual.update(percentage: nuevo_porcentaje.round(2))
            end 
          end
          @domain = Domain.create(type_modality: params[:domain][:type_modality], price: params[:domain][:price].to_i, date_posetion: params[:domain][:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:domain][:percentage].to_f, notario_id: params[:domain][:notario_id], valor: params[:domain][:valor].to_i) 
          DomainRol.create(type_member: 'Legal', type_rol: 'Aumentador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
          redirect_to @legalpersona
        end
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
    if @domain.type_modality == "Compra y Venta de acciones"
      @domrol = DomainRol.where(domain_id: @domain.id)
      @domrol.each do |domrol|
        member = PersonaMember.where(persona_id: domrol.persona_id, type_member: domrol.type_member, legal_persona_id: @domain.domainable_id)
        if member.length == 0
          historico = Historico.where(persona_id: domrol.persona_id,type_member: domrol.type_member,  legal_persona_id: @domain.domainable_id)
          porcentaje = (historico[0].acciones*100).to_f/@legalpersona.acciones
          PersonaMember.create(legal_persona_id: @domain.domainable_id, type_member: domrol.type_member, persona_id: domrol.persona_id, acciones: historico[0].acciones, percentage: porcentaje.round(2), entrada: historico[0].entrada)
          @compradores = Comprador.where(domain_rol_id: domrol.id)
          @compradores.each do |comp|
            member_d = PersonaMember.where(persona_id: comp.persona_id, type_member: comp.type_member, legal_persona_id: @legalpersona.id)
            acciones = member_d[0].acciones - comp.acciones
            if acciones == 0
              member_d[0].destroy
            else
              porcentaje = ((acciones * 100)/@legalpersona.acciones).to_f
              member_d.update(acciones: acciones, percentage: porcentaje.round(2))
            end
            comp.destroy
          end
          domrol.destroy
        else
          total = 0
          @compradores = Comprador.where(domain_rol_id: domrol.id)
          @compradores.each do |comp|
            total += comp.acciones
            member_d = PersonaMember.where(persona_id: comp.persona_id, type_member: comp.type_member, legal_persona_id: @legalpersona.id)
            acciones = member_d[0].acciones - comp.acciones
            if acciones == 0
              member_d[0].destroy
            else
              porcentaje = ((acciones * 100)/@legalpersona.acciones).to_f
              member_d.update(acciones: acciones, percentage: porcentaje.round(2))
            end
            comp.destroy
          end
          domrol.destroy
          acciones = total + member[0].acciones.to_i
          porcentaje = ((acciones*100)/@legalpersona.acciones).to_f
          member[0].update(acciones: acciones, percentage: porcentaje)
        end
      end
    elsif @domain.type_modality == "Añadir acciones"
      @legalpersona = LegalPersona.find(@domain.domainable_id)
      DomainRol.order(:id).each do |domrol|
        if domrol.domain_id == @domain.id
          member = PersonaMember.where(persona_id: domrol.persona_id, type_member: domrol.type_member, legal_persona_id: @domain.domainable_id)
          if member[0].acciones - @domain.price == 0
            member[0].destroy
            @legalpersona.update(acciones: @legalpersona.acciones - @domain.price, total: @legalpersona.total - @domain.valor)
            domrol.destroy
            flash[:notice] = "Eliminado correctamente"
          else
            @legalpersona.update(acciones: @legalpersona.acciones - @domain.price, total: @legalpersona.total - @domain.valor)
            accion = member[0].acciones - @domain.price
            porcentaje = ((accion*100)/@legalpersona.acciones).to_f
            member[0].update(acciones: accion, percentage: porcentaje)
            domrol.destroy
            flash[:notice] = "Eliminado correctamente"
          end
        end
      end
      @miembros = PersonaMember.where(legal_persona_id: @legalpersona.id)
      @miembros.each do |miembro|
        new_percentage = (miembro.acciones*100).to_f/@legalpersona.acciones
        miembro.update(percentage: new_percentage.round(2))
      end    
    else
      domrol.destroy  
    end  
    @activos = PersonaMember.where(legal_persona_id: @legalpersona.id)
    @historicos = Historico.where(legal_persona_id: @legalpersona.id)
    @activos.each do |activos|
      @historicos.each do |historicos|
        if (activos.persona_id == historicos.persona_id)
          if (activos.type_member == historicos.type_member)
            historicos.destroy
          end
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

  def creador_empresa
    total = 0
    porcentaje = 0
    begin
      @legalpersona = LegalPersona.find(params[:legal_persona_id])
      if (@legalpersona.total != 0) && (@legalpersona.acciones != 0)
        Rails.logger.info params[:vendedor]
        (0..params[:price].length-1).each do |i|
          total += params[:price][i].to_i
          Rails.logger.info params[:price][i]
        end
        if (total != @legalpersona.total)  
          flash[:alert] = "El dinero es distinto"
          redirect_to creadores_path(@legalpersona)
        else
          (0..params[:percentage].length-1).each do |i|
            porcentaje += params[:percentage][i].to_f
            Rails.logger.info params[:percentage][i]
          end
          if porcentaje != 100
            flash[:alert] = "Porcentaje distinto a 100"
            redirect_to creadores_path(@legalpersona)
          else
            (0..params[:vendedor].length-1).each do |i|
              if params[:vendedor][i].chars[params[:vendedor][i].length - 1] == 'N'
                acciones = (params[:percentage][i].to_f * @legalpersona.acciones)/100
                PersonaMember.create(legal_persona_id: @legalpersona.id, percentage: params[:percentage][i].to_f, type_member: "Natural", persona_id: params[:vendedor][i].split("N")[0].to_i, acciones: acciones.to_i, entrada: params[:date_posetion], capital_actual: -params[:price][i].to_i) 
                @domain = Domain.create(type_modality: params[:type_modality], price: acciones.to_i, date_posetion: params[:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:percentage][i].to_f, notario_id: params[:domain][:notario_id], valor: params[:price][i].to_i)
                DomainRol.create(type_member: "Natural", type_rol: "Creador", persona_id: params[:vendedor][i].split("N")[0].to_i, domain_id: @domain.id)
              else
                Rails.logger.info "Es legal"
                acciones = (params[:percentage][i].to_f * @legalpersona.acciones)/100
                PersonaMember.create(legal_persona_id: @legalpersona.id, percentage: params[:percentage][i].to_f, type_member: "Legal", persona_id: params[:vendedor][i].split("L")[0].to_i, acciones: acciones.to_i, entrada: params[:date_posetion], capital_actual: -params[:price][i].to_i)
                @domain = Domain.create(type_modality: params[:type_modality], price: acciones.to_i, date_posetion: params[:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:percentage][i].to_f, notario_id: params[:domain][:notario_id], valor: params[:price][i].to_i) 
                DomainRol.create(type_member: "Legal", type_rol: "Creador", persona_id: params[:vendedor][i].split("L")[0].to_i, domain_id: @domain.id)
              end
            end
            redirect_to @legalpersona
          end  
          
        end
      else
        flash[:alert] = "No existen acciones y/o capital"
        redirect_to @legalpersona  
      end  
    rescue => exception
      Rails.logger.info exception.to_s
    end 
  end

  def compra_venta
   begin
      @legal_persona = LegalPersona.find(params[:legal_persona_id])
      total_p = 0
      total_a = 0

      (0..params[:percentage].length-1).each do |i|
        if (params[:percentage][i].to_f <= 0) || (params[:percentage][i].to_i > 100)   
          redirect_to compraventas_path(@legal_persona)
          flash[:alert] = "El porcentaje solo puede ser entre 0 y 100"
        end
        total_p += params[:price][i].to_i
        if params[:vendedor][i].chars[params[:vendedor][i].length - 1] == 'N'
          @personam = PersonaMember.where(persona_id: params[:vendedor][i].split("N")[0].to_i ,type_member: "Natural", legal_persona_id: @legal_persona.id)
          total_a += @personam[0].acciones*(params[:percentage][i].to_f/100)
        else
          @personam = PersonaMember.where(persona_id: params[:vendedor][i].split("L")[0].to_i ,type_member: "Legal", legal_persona_id: @legal_persona.id)
          total_a += @personam[0].acciones*(params[:percentage][i].to_f/100)
        end
      end
      porcentaje = (total_a*100)/@legal_persona.acciones.to_f 
      @domain = Domain.create(type_modality: params[:type_modality], price: total_a, date_posetion: params[:date_posetion], domainable_type: "LegalPersona", domainable_id: params[:legal_persona_id], percentage: porcentaje.round(2), notario_id: params[:domain][:notario_id], valor: total_p)

      (0..params[:vendedor].length-1).each do |i|
        if params[:vendedor][i].chars[params[:vendedor][i].length - 1] == 'N'
          @personam = PersonaMember.where(persona_id: params[:vendedor][i].split("N")[0].to_i ,type_member: "Natural", legal_persona_id: @legal_persona.id)
          @domrol = DomainRol.create(type_member: "Natural", type_rol: "Vendedor", persona_id: params[:vendedor][i].split("N")[0].to_i, domain_id: @domain.id, percentage: params[:percentage][i].to_f, precio: params[:price][i].to_i, acciones_venta:  @personam[0].acciones*(params[:percentage][i].to_f/100))
          persona = PersonaMember.where(persona_id: params[:vendedor][i].split("N")[0].to_i, type_member: "Natural", legal_persona_id: @legal_persona.id)
          n_acciones = persona[0].acciones - persona[0].acciones*((@domrol.percentage/100).to_f)
          if n_acciones <= 0
            Historico.create(persona_id: params[:vendedor][i].split("N")[0].to_i, type_member: "Natural", legal_persona_id: @legal_persona.id, salida: @domain.date_posetion, entrada: persona[0].entrada, valor: params[:price][i].to_i, acciones: persona[0].acciones*((@domrol.percentage/100).to_f))
            persona[0].destroy         
          else
            porcentaje = (n_acciones*100).to_f/@legal_persona.acciones
            persona[0].update(acciones: n_acciones, percentage: porcentaje.round(2))
          end 
        else
          @personam = PersonaMember.where(persona_id: params[:vendedor][i].split("L")[0].to_i ,type_member: "Legal", legal_persona_id: @legal_persona.id)
          @domrol = DomainRol.create(type_member: "Legal", type_rol: "Vendedor", persona_id: params[:vendedor][i].split("L")[0].to_i, domain_id: @domain.id, percentage: params[:percentage][i].to_f, precio: params[:price][i].to_i, acciones_venta:  @personam[0].acciones*(params[:percentage][i].to_f/100))
          persona = PersonaMember.where(persona_id: params[:vendedor][i].split("L")[0].to_i, type_member: "Legal", legal_persona_id: @legal_persona.id)
          n_acciones = persona[0].acciones - persona[0].acciones*((@domrol.percentage/100).to_f) 
          if n_acciones <= 0
            Historico.create(persona_id: params[:vendedor][i].split("L")[0].to_i, type_member: "Legal", legal_persona_id: @legal_persona.id, salida: @domain.date_posetion, entrada: persona[0].entrada, valor: params[:price][i].to_i, acciones: persona[0].acciones*((@domrol.percentage/100).to_f))
            persona[0].destroy         
          else
            porcentaje = (n_acciones*100).to_f/@legal_persona.acciones
            persona[0].update(acciones: n_acciones, percentage: porcentaje.round(2))
          end
        end
                  
      end
      Rails.logger.info total_p
      Rails.logger.info total_a
      Rails.logger.info porcentaje.round(2)
      redirect_to @legal_persona
    rescue => exception
      Rails.logger.info exception.to_s
    end
    
  end

  def modificacion
    begin
      @legalpersona = LegalPersona.find(params[:legal_persona_id])
      params[:percentage] = 0
      params[:price] = 0
      if ((params[:percentage]).to_i ) <= 100
        @domain = Domain.create(type_modality: params[:type_modality], price: params[:price], date_posetion: params[:date_posetion], domainable_type: "LegalPersona", domainable_id: params[:legal_persona_id], percentage: params[:percentage], notario_id: params[:domain][:notario_id], valor: params[:valor])
        if @domain.save
          c = params[:vendedor]
          if c.chars[c.length - 1] == "N"                
            DomainRol.create(type_member: 'Natural', type_rol: 'Modificador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)     
          else 
            DomainRol.create(type_member: 'Legal', type_rol: 'Modificador', persona_id: c.split("L")[0].to_i, domain_id: @domain.id)         
          end     
          redirect_to @legalpersona, notice: "Escritura añadida!"
        else
          flash[:errors] = @domain.errors.full_messages
          redirect_to modificaciones_path(@legalpersona)
        end
      else
        flash[:alert] = "El porcentaje de participacion excede el 100%"
        redirect_to modificaciones_path(@legalpersona)      
      end
    rescue => exception
      Rails.logger.info exception.to_s
    end
  end

  def agregar_accion
    Rails.logger.info params
    c = params[:vendedor]
    if c.chars[c.length - 1] == "N"
      Rails.logger.info "Es Natural"
      member = PersonaMember.where(persona_id: c.chars[0].to_i, type_member: "Natural", legal_persona_id: params[:legal_persona_id])
      if member.length == 0
        @legalpersona = LegalPersona.find(params[:legal_persona_id])
        @legalpersona.update(acciones: (@legalpersona.acciones + params[:price].to_i), total: (@legalpersona.total + params[:valor].to_i ))
        porcentaje = (params[:price].to_i * 100).to_f/@legalpersona.acciones
        PersonaMember.create(legal_persona_id: @legalpersona.id, percentage: porcentaje.to_f.round(2), type_member: "Natural", persona_id: c.chars[0].to_i, acciones: params[:price].to_i, entrada: params[:date_posetion], capital_actual: -params[:valor].to_i)
        @actuales = PersonaMember.where(legal_persona_id: @legalpersona.id)
        @actuales.each do |actual|
          if actual.id != member[0].id
            nuevo_porcentaje = (actual.acciones * 100).to_f/@legalpersona.acciones
            actual.update(percentage: nuevo_porcentaje.round(2))
          end 
        end
        @domain = Domain.create(type_modality: params[:type_modality], price: params[:price].to_i, date_posetion: params[:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:percentage].to_f, notario_id: params[:domain][:notario_id], valor: params[:valor].to_i) 
        DomainRol.create(type_member: 'Natural', type_rol: 'Aumentador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
        Rails.logger.info "No existe"
        redirect_to legalpersona
      else
        @legalpersona = LegalPersona.find(params[:legal_persona_id])
        nueva_accion = @legalpersona.acciones + params[:price].to_i
        nuevo_total = @legalpersona.total + params[:valor].to_i
        @legalpersona.update(acciones: nueva_accion, total: nuevo_total)
        nueva_accion = member[0].acciones + params[:price].to_i 
        member[0].update(acciones: nueva_accion, percentage: ((nueva_accion*100)/@legalpersona.acciones).to_f, capital_actual: member[0].capital_actual - params[:valor].to_i)
        @actuales = PersonaMember.where(legal_persona_id: @legalpersona.id)
        @actuales.each do |actual|
          if actual.id != member[0].id
            nuevo_porcentaje = (actual.acciones * 100).to_f/@legalpersona.acciones
            actual.update(percentage: nuevo_porcentaje.round(2))
          end 
        end
        @domain = Domain.create(type_modality: params[:type_modality], price: params[:price].to_i, date_posetion: params[:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:percentage].to_f, notario_id: params[:domain][:notario_id], valor: params[:valor].to_i) 
        DomainRol.create(type_member: 'Natural', type_rol: 'Aumentador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
        redirect_to @legalpersona
      end
    else
      Rails.logger.info "Es Legal"
      member = PersonaMember.where(persona_id: c.chars[0].to_i, type_member: "Legal", legal_persona_id: params[:legal_persona_id])
      if member.length == 0
        @legalpersona = LegalPersona.find(params[:legal_persona_id])
        @legalpersona.update(acciones: (@legalpersona.acciones + params[:price].to_i), total: (@legalpersona.total + params[:valor].to_i ))
        porcentaje = (params[:price].to_i * 100).to_f/@legalpersona.acciones
        PersonaMember.create(legal_persona_id: @legalpersona.id, percentage: porcentaje.to_f.round(2), type_member: "Legal", persona_id: c.chars[0].to_i, acciones: params[:price].to_i, entrada: params[:date_posetion], capital_actual: -params[:valor].to_i )
        @actuales = PersonaMember.where(legal_persona_id: @legalpersona.id)
        @actuales.each do |actual|
          nuevo_porcentaje = (actual.acciones * 100).to_f/@legalpersona.acciones
          actual.update(percentage: nuevo_porcentaje.round(2))
        end 
        @domain = Domain.create(type_modality: params[:type_modality], price: params[:price].to_i, date_posetion: params[:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:percentage].to_f, notario_id: params[:domain][:notario_id], valor: params[:valor].to_i) 
        DomainRol.create(type_member: 'Legal', type_rol: 'Aumentador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
        Rails.logger.info "No existe"
        redirect_to legalpersona
      else
        @legalpersona = LegalPersona.find(params[:legal_persona_id])
        nueva_accion = @legalpersona.acciones + params[:price].to_i
        nuevo_total = @legalpersona.total + params[:valor].to_i
        @legalpersona.update(acciones: nueva_accion, total: nuevo_total)
        nueva_accion = member[0].acciones + params[:price].to_i 
        member[0].update(acciones: nueva_accion, percentage: ((nueva_accion*100)/@legalpersona.acciones).to_f, capital_actual: member[0].capital_actual - params[:valor].to_i)
        @actuales = PersonaMember.where(legal_persona_id: @legalpersona.id)
        @actuales.each do |actual|
          if actual.id != member[0].id
            nuevo_porcentaje = (actual.acciones * 100).to_f/@legalpersona.acciones
            actual.update(percentage: nuevo_porcentaje.round(2))
          end 
        end
        @domain = Domain.create(type_modality: params[:type_modality], price: params[:price].to_i, date_posetion: params[:date_posetion], domainable_id: @legalpersona.id, domainable_type: 'LegalPersona', percentage: params[:percentage].to_f, notario_id: params[:domain][:notario_id], valor: params[:valor].to_i) 
        DomainRol.create(type_member: 'Legal', type_rol: 'Aumentador', persona_id: c.split("N")[0].to_i, domain_id: @domain.id)
        redirect_to @legalpersona
      end
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
    begin
      params.require(:domain).permit(:type_modality, :inscription_id, :price, :date_posetion, :percentage, :notario_id, :valor)
    rescue => exception
      params.permit(:type_modality, :inscription_id, :price, :date_posetion, :percentage, :notario_id, :valor)
    end
    
  end

  def load_domainable
    klass = [LegalPersona].detect { |c| params["#{c.name.underscore}_id"]}
    @domainable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
