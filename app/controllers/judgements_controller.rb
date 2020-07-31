class JudgementsController < ApplicationController
  before_action :set_judgement, only: [:edit, :show]
  load_and_authorize_resource
  def index
    @judgements = Judgement.all
  end

  def new
    @judgement = Judgement.new
  end

  def create
    Rails.logger.info (judgement_params.pop())
    Rails.logger.info (judgement_params.to_json())
    @judgement = Judgement.new(judgement_params.pop())
    @judgement.save
    redirect_to judgements_path
  end

  def edit

  end
  def show

  end



  private
  def set_judgement
    @judgement = Judgement.find(params[:id])
  end

  def judgement_params
    params.require(:judgement).permit(:type_judgement, :court_id, :demandante, :demandado, :lyrics, :number, :year)

  end
end
def region_params
  params.require(:region).permit(:name, :number_region,:file , :provinces_attributes => [:id,:name,
  :communes_attributes => [:id,:name,:cod_treasury,:conara_sii]]
)
end