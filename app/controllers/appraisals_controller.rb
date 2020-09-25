class AppraisalsController < ApplicationController
  load_and_authorize_resource
  before_action :set_appraisal, only:  [:show,:edit]

  def index
    @appraisals = Appraisal.order("id").page(params[:page]).per_page(10)
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
  end

  def edit
  end

  def update
    @appraisal.update(appraisal_params)
    redirect_to appraisals_path
  end



  def destroy
    @appraisal.destroy
    redirect_to appraisals_path
  end

  private

  def set_appraisal
    @appraisal = Appraisal.find(params[:id])
  end

  def appraisal_params
    params.require(:appraisal).permit(:realty_id, :date, :entity, :price_uf, :price_clp, :price_usd, :observation, :address, :file_name )

  end

end
