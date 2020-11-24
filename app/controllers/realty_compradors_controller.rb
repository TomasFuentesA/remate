class RealtyCompradorsController < InheritedResources::Base

  def index
  end

  def new
  end

  def create
    Rails.logger.info params
    @real_domrol = RealtyDomainrol.find(params[:realty_domainrols_id])
    @real_domain = RealtyDomain.find(@real_domrol.realty_domains_id)
    @comprador_actual = RealtyComprador.where(realty_domainrols_id: @real_domrol.id)
    
    porcentaje_total = 0
    total = 0
    @comprador_actual.each do |comprador|
      porcentaje_total += comprador.percentage
      total += comprador.precio
    end
    Rails.logger.info total
    if (total + params[:price].to_i) <= @real_domrol.valor
      if (porcentaje_total.to_f + params[:percentage].to_f.round(2)) <= 100
        if (params[:type_member] == "Natural")
          @comprador = RealtyComprador.create(type_member: "Natural", persona_id: params[:persona_id], precio: params[:price], realty_domainrols_id: params[:realty_domainrols_id], percentage: params[:percentage])
          @realty_dueno = RealtyDueno.where(type_member: "Natural", persona_id: @comprador.persona_id, realty_id: @real_domain.realty_id)
          if @realty_dueno.length != 0
            @realty_dueno[0].update(percentage: @realty_dueno[0].percentage + ((@real_domrol.cantidad * @comprador.percentage).to_f/100).round(2))
          else
            RealtyDueno.create(persona_id: @comprador.persona_id, type_member: "Natural", realty_id: @real_domain.realty_id, percentage: ((@real_domrol.cantidad.to_f * (@comprador.percentage)/100).to_f.round(2)), entrada: @real_domain.date_posetion)
          end         
          redirect_to @real_domain, notice: "Comprador creado con exito"
        else
          @comprador = RealtyComprador.create(type_member: "Legal", persona_id: params[:persona_id], precio: params[:price], realty_domainrols_id: params[:realty_domainrols_id], percentage: params[:percentage])
          @realty_dueno = RealtyDueno.where(type_member: "Legal", persona_id: @comprador.persona_id, realty_id: @real_domain.realty_id)
          if @realty_dueno.length != 0
            @realty_dueno[0].update(percentage: @realty_dueno[0].percentage + ((@real_domrol.cantidad * @comprador.percentage).to_f/100).round(2))
          else        
            RealtyDueno.create(persona_id: @comprador.persona_id, type_member: "Legal", realty_id: @real_domain.realty_id, percentage: ((@real_domrol.cantidad.to_f * (@comprador.percentage/100.to_f)).round(2)), entrada: @real_domain.date_posetion)
          end      
          redirect_to @real_domain, notice: "Comprador creado con exito"
        end
      else
        flash[:alert] = "Porcentaje supera al 100"
        redirect_to @real_domain
      end
    else      
      flash[:alert] = "Precio supera al aceptable"
      redirect_to @real_domain
    end 
  end

  def destroy
    @comprador = RealtyComprador.find(params[:id])
    @real_domrol = RealtyDomainrol.find(@comprador.realty_domainrols_id)
    @real_domain = RealtyDomain.find(@real_domrol.realty_domains_id)
    @dueno = RealtyDueno.where(persona_id: @comprador.persona_id, type_member: @comprador.type_member, realty_id: @real_domain.realty_id)
    new_porcentaje = @dueno[0].percentage.to_f - (@real_domrol.cantidad.to_f * @comprador.percentage.to_f)/100.round(2)
    if new_porcentaje == 0
      @dueno[0].destroy
      @comprador.destroy
    else
      @dueno[0].update(percentage: new_porcentaje)
      @comprador.destroy
    end
    redirect_to @real_domain, notice: "Comprador borrado con exito"
  end

  def update
  end

  private

    def realty_comprador_params
      params.require(:realty_comprador).permit(:persona_id, :type_member, :precio, :percentage, :realty_domainrols_id)
    end

end
