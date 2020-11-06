class JudgementsController < ApplicationController
  before_action :set_judgement, only: [:edit, :show]
  
  load_and_authorize_resource
  def index
      @judgement = Judgement.order("name_judgement").page(params[:page]).per_page(10)
  end

  def new
    @judgement = Judgement.new
  end

  def create
    @auctionnotices_id=params['format']?params['format']:''
    @judgement = Judgement.new(judgement_params)
    if @judgement.save
      if @auctionnotices_id != ""
        redirect_to new_auctionnotice_auction_path(@auctionnotices_id)
      else
        redirect_to judgements_path
      end
    end
  end

  def edit
 
  end
  def show

  end

  def update
    Rails.logger.info params
    @judgementPersonasValidate = JudgementPersonas.where(judgement_id:params[:id])
    @judgementPersonasValidate.destroy_all
    params[:judgement][:demandadoList].each do |p|
      if(p.to_s !="")
        @num = p.to_i
        @idPersona = (p.to_i < 0) ? @num * -1 : @num;
        @tipo = (p.to_i < 0) ? "Legal" : "Natural"
        @judgementPersonas = JudgementPersonas.new(judgement_id:params[:id],persona_id:@idPersona,persona_type:@tipo,judgement_type:"demandado")
        @judgementPersonas.save
      end
    end
    params[:judgement][:demandanteList].each do |p|
      if(p.to_s !="")
        @num = p.to_i
        @idPersona = (p.to_i < 0) ? @num * -1 : @num;
        @tipo = (p.to_i < 0) ? "Legal" : "Natural"
        @judgementPersonas = JudgementPersonas.new(judgement_id:params[:id],persona_id:@idPersona,persona_type:@tipo,judgement_type:"demandante")
        @judgementPersonas.save
      end
    end
    @judgement.update(judgement_params)
    redirect_to judgements_path
  end

  def destroy
    @judgement.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to judgements_path, notice: "eliminado exitosamente" }
      format.json {head :no_content }
    end
  end

  def searchFilterData 
    @param = "%"+params[:q]+"%"
    @judgement = Judgement.where("concat(lyrics , number , year, demandante, demandado) like ?",@param)
    render json: @judgement
  end

  private
  def set_judgement
    @judgement = Judgement.find(params[:id])
  end

  def judgement_params
    begin
      params.require(:judgement).permit(:type_judgement, :court_id, :demandante, :demandado, :lyrics, :number, :year)
    rescue Exception => error
      params.permit(:type_judgement, :court_id, :demandante, :demandado, :lyrics, :number, :year)
    end
  end
end