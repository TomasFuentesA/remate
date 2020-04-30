class AppraisalsController < ApplicationController

  load_and_authorize_resource

  def index
    @appraisals = Appraisal.all
  end

  def new
    @appraisal = Appraisal.new
  end

  def create
    @appraisal = Appraisal.new(appraisal_params)
    @appraisal.save
    redirect_to appraisals_path
  end

  def show
      @appraisal = Appraisal.find(params[:id])
  end

  def edit
    @appraisal = Appraisal.find(params[:id])
  end

  def destroy
    @appraisal.destroy
    redirect_to appraisals_path
  end

  private

  def appraisal_params
    params.require(:appraisal).permit(:realty_id, :date, :entity, :price_uf, :price_clp, :price_usd, :observation )

  end

end
