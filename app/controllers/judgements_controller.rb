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
    @judgement = Judgement.new(judgement_params)
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
    params.require(:judgement).permit(:type_judgement, :court_id, :demandante, :demandado, :auction_id, :lyrics, :number, :year)

  end
end
