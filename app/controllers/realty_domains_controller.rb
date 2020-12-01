class RealtyDomainsController < InheritedResources::Base
  load_and_authorize_resource

  def new
    Rails.logger.info params
  
  end


  def create
    Rails.logger.info params
    total = 0
    porcentaje = 0
    cont = 0
    params[:vendedor].each do |vende|
      if vende.chars[vende.length - 1 ] == "N"
        @dueno = RealtyDueno.where(type_member: "Natural", persona_id: vende.split("N")[0].to_i, realty_id: params[:realty_domain][:realty_id])
        porcentaje_v = ((@dueno[0].percentage.to_f * params[:percentage_v][cont].to_f)/100).round(2)
        porcentaje += porcentaje_v
        cont += 1 
      else
        @dueno = RealtyDueno.where(type_member: "Legal", persona_id: vende.split("L")[0].to_i, realty_id: params[:realty_domain][:realty_id])
        porcentaje_v = ((@dueno[0].percentage.to_f * params[:percentage_v][cont].to_f)/100).round(2)
        porcentaje += porcentaje_v
        cont += 1
      end
    end
    params[:valor].each do |valor|
      total += valor.to_i
    end

    if params[:realty_domain][:notario_id].chars[params[:realty_domain][:notario_id].length - 1 ] == "N"
      @realtydomain = RealtyDomain.create(type_modality: params[:realty_domain][:type_modality], notario_id: params[:realty_domain][:notario_id], notario_type: "Natural" ,realty_id: params[:realty_domain][:realty_id], date_posetion: params[:realty_domain][:date_posetion], price: params[:realty_domain][:total_clp], precio_uf: params[:realty_domain][:total_uf], precio_euro: params[:realty_domain][:total_euro], precio_usd: params[:realty_domain][:total_usd], observation: params[:realty_domain][:observation], type_currency: params[:realty_domain][:type_currency], percentage: porcentaje)
    else
      @realtydomain = RealtyDomain.create(type_modality: params[:realty_domain][:type_modality], notario_id: params[:realty_domain][:notario_id], notario_type: "Legal" ,realty_id: params[:realty_domain][:realty_id], date_posetion: params[:realty_domain][:date_posetion], price: params[:realty_domain][:total_clp], precio_uf: params[:realty_domain][:total_uf], precio_euro: params[:realty_domain][:total_euro], precio_usd: params[:realty_domain][:total_usd], observation: params[:realty_domain][:observation], type_currency: params[:realty_domain][:type_currency], percentage: porcentaje)
    end


    if @realtydomain.save
      i = 0
      params[:vendedor].each do |vendedor|
        if vendedor.chars[vendedor.length - 1 ] == "N"
          if (params[:percentage_v][i].to_f <= 0) || (params[:percentage_v][i].to_i > 100) 
            @eliminar = RealtyDomainrol.where(realty_domains_id: @realtydomain.id)
            Rails.logger.info @eliminar.length
            if @eliminar.length != 0
              @eliminar.each do |eliminar|
                eliminar.destroy
              end
            end
            @realtydomain.destroy
            flash[:alert] = "Excede el porcentaje"
            redirect_to(new_realty_domain_path) and return
          else
            @vendedor = RealtyDueno.where(type_member: "Natural", persona_id: vendedor.split("N")[0].to_i, realty_id: @realty_domain.realty_id)
            valor = (@vendedor[0].percentage * params[:percentage_v][i].to_f.round(2))/100
            @realdomrol = RealtyDomainrol.create(type_member: "Natural", type_rol: "Vendedor", persona_id: vendedor.split("N")[0].to_i, realty_domains_id: @realtydomain.id, percentage: (params[:percentage_v][i].to_f.round(2)).to_i, valor: params[:valor][i], cantidad: valor )
            @vendedor[0].update(percentage: @vendedor[0].percentage - @realdomrol.cantidad)
            if @vendedor[0].percentage == 0
              RealtyDuenoHistorico.create(persona_id: @vendedor[0].persona_id, realty_id: @vendedor[0].realty_id, type_member: @vendedor[0].type_member, entrada: @vendedor[0].entrada, salida: @realty_domain.date_posetion)
              @vendedor[0].destroy
            end
            i += 1
          end        
        else
          if (params[:percentage_v][i].to_f <= 0) || (params[:percentage_v][i].to_i > 100)
            @eliminar = RealtyDomainrol.where(realty_domains_id: @realtydomain.id)
            if @eliminar.length != 0
              @eliminar.each do |eliminar|
                eliminar.destroy
              end
            end
            @realtydomain.destroy
            flash[:alert] = "Excede el porcentaje"
            redirect_to(new_realty_domain_path) and return
          else
            @vendedor = RealtyDueno.where(type_member: "Legal", persona_id: vendedor.split("L")[0].to_i, realty_id: @realty_domain.realty_id)
            valor = (@vendedor[0].percentage * params[:percentage_v][i].to_f.round(2))/100
            @realdomrol = RealtyDomainrol.create(type_member: "Legal", type_rol: "Vendedor", persona_id: vendedor.split("L")[0].to_i, realty_domains_id: @realtydomain.id, percentage: params[:percentage_v][i].to_f.round(2), valor: params[:valor][i], cantidad: valor)
            @vendedor[0].update(percentage: @vendedor[0].percentage - @realdomrol.cantidad)
            if @vendedor[0].percentage == 0
              RealtyDuenoHistorico.create(persona_id: @vendedor[0].persona_id, realty_id: @vendedor[0].realty_id, type_member: @vendedor[0].type_member, entrada: @vendedor[0].entrada, salida: @realty_domain.date_posetion)
              @vendedor[0].destroy
            end
            i += 1
          end
        end
      end
      flash[:notice] = "Compra y Venta generada con exito"
      redirect_to @realtydomain
    end
    
  end

  def destroy
    @realty_domain = RealtyDomain.find(params[:id])
    @realty_domrols = RealtyDomainrol.where(realty_domains_id: @realty_domain.id)
    @realty_domrols.each do |domrol|
      @realty_dueno = RealtyDueno.where(persona_id: domrol.persona_id, type_member: domrol.type_member, realty_id: @realty_domain.realty_id)
      if @realty_dueno.length == 0
        @dueno_historico = RealtyDuenoHistorico.where(persona_id: domrol.persona_id, type_member: domrol.type_member, realty_id: @realty_domain.realty_id)
        RealtyDueno.create(persona_id: domrol.persona_id, type_member: domrol.type_member, realty_id: @realty_domain.realty_id, entrada: @dueno_historico[0].entrada, percentage: domrol.cantidad)
        @dueno_historico[0].destroy
        @comprador = RealtyComprador.where(realty_domainrols_id: domrol.id)
        if @comprador.length != 0
          @comprador.each do |comprador|
            @dueno = RealtyDueno.where(persona_id: comprador.persona_id, type_member: comprador.type_member, realty_id: @realty_domain.realty_id)    
            new_porcentaje = @dueno[0].percentage.to_f - (domrol.cantidad.to_f * comprador.percentage.to_f)/100.round(2)
            if new_porcentaje == 0
              @dueno[0].destroy
              comprador.destroy
            else
              @dueno[0].update(percentage: new_porcentaje)
              comprador.destroy
            end
          end
        end
        domrol.destroy
      else
        @comprador = RealtyComprador.where(realty_domainrols_id: domrol.id)
        if @comprador.length != 0
          @comprador.each do |comprador|
            @dueno = RealtyDueno.where(persona_id: comprador.persona_id, type_member: comprador.type_member, realty_id: @realty_domain.realty_id)    
            new_porcentaje = @dueno[0].percentage.to_f - (domrol.cantidad.to_f * comprador.percentage.to_f)/100.round(2)
            if new_porcentaje == 0
              @dueno[0].destroy
              comprador.destroy
            else
              @dueno[0].update(percentage: new_porcentaje)
              comprador.destroy
            end
          end
        end      
        @realty_dueno[0].update(percentage: @realty_dueno[0].percentage + domrol.cantidad)
        domrol.destroy
      end
    end

    @realty_domfiles = RealtyDomainfile.where(realty_domains_id: @realty_domain.id)

    if @realty_domfiles.length != 0
      @realty_domfiles.each do |domfile|
        domfile.destroy
      end 
    end

    @realty_inscription = RealtyInscription.where(realty_domains_id: @realty_domain.id)
    if @realty_inscription.length != 0
      @realty_inscription.each do |realty_inscrip|
        @realty_inscriptionfile = RealtyInscriptionfile.where(realty_inscription_id: realty_inscrip.id)
        if @realty_inscriptionfile.length != 0
          @realty_inscriptionfile.each do |inscrip_file|
            inscrip_file.destroy
          end
        end
        realty_inscrip.destroy
      end  
    end

    
    @realty_domain.destroy
    redirect_to realty_domains_path, notice: "Eliminado correctamente"
      
  end

  private

    def realty_domain_params
      params.require(:realty_domain).permit(:notario_id , :type_modality, :price, :date_posetion, :observation, :type_currency ,:realty_id)
    end

end
