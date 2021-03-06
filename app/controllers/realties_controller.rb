class RealtiesController < ApplicationController
  load_and_authorize_resource
  before_action :set_hash , only: [:show,:new]
  before_action :set_realty , only: [:edit,:show,:destroy]

  def index
    @condominios = Condominio.all
    @realties = Realty.all
    @hash = Gmaps4rails.build_markers(@realties) do |realty, marker|
      marker.lat realty.latitude
      marker.lng realty.longitude
    end
  end

  def new
    @condominios = Condominio.all
    @realty = Realty.new
    @realty.build_type_realty
  end

  def create
    @auctionnotices_id=params['format']?params['format']:''
    @realty = Realty.new(realty_params)
    if @realty.save
      if @auctionnotices_id != ""
        redirect_to new_auctionnotice_auction_path(@auctionnotices_id)
      else
        redirect_to @realty, notice: "Propiedad Ingresada"
      end
    else
      Rails.logger.info "probando crear new realty"
      render :json => { :errors => @realty.errors.full_messages }
    end
    
  end

  def show
    @auction_id=params['format']?params['format']:''
    @fileUpload = FileUpload.where(model_id:params['id'])
    @condominios = Condominio.all
  end

  def edit

    @fileUpload = FileUpload.where(model_id:params['id'])
    @auction_id=params['format']
    @condominios = Condominio.all
    @realty.build_characteristic if @realty.characteristic.nil?
    @realty.build_type_realty if @realty.type_realty.nil?
  end

  def update
    i = 0
    j = 0
    Rails.logger.info params[:id]
    if params[:dueño].length != 0 
      params[:dueño].each do |dueño|
        if (params[:percentage][i].to_f <= 0) || (params[:percentage][i].to_i > 100)
          @eliminar = RealtyDueno.where(realty_id: @realty.id)
          @eliminar.each do |eliminar|
            eliminar.destroy
          end
          flash[:alert] = "Error en el valor del porcentaje"
          redirect_to(edit_realty_path(@realty)) and return
        else
          j += params[:percentage][i].to_f
          if j <= 100.0
            if dueño.chars[dueño.length - 1] == 'N'
              RealtyDueno.create(persona_id: dueño.split("N")[0].to_i, type_member: "Natural", realty_id: params[:id], percentage: params[:percentage][i], entrada: params[:entrada][i])
              i += 1
            else
              RealtyDueno.create(persona_id: dueño.split("L")[0].to_i, type_member: "Legal", realty_id: params[:id], percentage: params[:percentage][i],  entrada: params[:entrada][i])
              i += 1
            end
          else
            @eliminar = RealtyDueno.where(realty_id: @realty.id)
            @eliminar.each do |eliminar|
              eliminar.destroy
            end
            flash[:alert] = "Error en el valor del porcentaje"
            redirect_to(edit_realty_path(@realty)) and return
          end
        end  
      end
    end  
    @auction_id = params['realty']['auction_id']
    @condominios = Condominio.all
    @realty.update(realty_params)
    if @auction_id != ""
      redirect_to auction_path(@auction_id)
    else
      redirect_to realties_path
    end
  end

  def destroy
    @realty.destroy
    @fileUpload = FileUpload.where(model_id:params['id'])
    @fileUpload.destroy_all
    respond_to do |format|
      format.js
      format.html {redirect_to realties_path, notice: "Propiedad: #{@realty.name_realty} eliminada exitosamente" }
      format.json {head :no_content }
    end
  end

  def searchFilterData 
    @param = "%"+params[:q]+"%"
    #Realty.where("concat( number_unit , name_realty, population_villa, street) like ?",@param)
    @realty = Realty.joins(:commune, :condominio).where("lower(concat( number_unit , name_realty, population_villa, street, communes.name, condominios.name)) like ?",@param)
    render json: @realty
  end

  def deleteUpload
    @fileUpload = FileUpload.find(params[:format])
    @fileUpload.destroy
    redirect_to edit_realty_path(@fileUpload.model_id)
  end

  def createUpload
    uploaded_pics = params['file']
    Rails.logger.info uploaded_pics
    uploaded_pics.each do |pic|
      File.open(Rails.root.join('public', 'uploads', pic[1].original_filename), 'wb') do |file|
        file.write(pic[1].read)
        Rails.logger.info pic[1].original_filename.to_s
        @fileUpload = FileUpload.new(file_name:pic[1].original_filename.to_s,model:'realty',model_id:params['realty_id'])
        @fileUpload.save
        File.rename(file, 'public/uploads/' + pic[1].original_filename)
      end
    end
    render json: { message: 'Imagenes ingresadas.'}
  end


  private
  def set_realty
    @realty = Realty.find(params[:id])
  end

  def set_hash
    @hash = Gmaps4rails.build_markers(@realty) do |realty, marker|
    marker.lat realty.latitude
    marker.lng realty.longitude
    end
  end

  def realty_params
    params.require(:realty).permit(:street, :number_unit, :unit_estate, :street_type_id, :commune_id, :population_villa, :apple, :property, :latitude, :longitude, :address,
       :type_property_id, :name_realty, :fiscal_destination, :condominio_id, characteristic_attributes: [ :m2_land, :m2_built , :material, :built_year], type_realty_attributes: [:tipo,:bathroom,:parking_lot,:cellar,:bedroom,:ambient,:comment] )
  end


end
