class JudgementsController < ApplicationController
  before_action :set_judgement, only: [:edit, :show]
  
  load_and_authorize_resource
  def index
    @validate = false
    if @validate
      @search = @judgement = Judgement.find_by(type_judgement: params[:q])
      render json: @search
    else
      @judgement = Judgement.all
    end  
  end

  def new
    @judgement = Judgement.new
  end

  def create
    Rails.logger.info judgement_params.to_h
    @judgement = Judgement.new(judgement_params)
    @judgement.save
    redirect_to judgements_path
  end

  def edit

  end
  def show

  end

  def update
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

  def search 
    Rails.logger.info  "prueba " + params[:q] 
    @param = "%"+params[:q]+"%"
    @judgement = @judgement = Judgement.where("concat(lyrics , number , year) like ?",@param)
    #@judgement = Judgement.all
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