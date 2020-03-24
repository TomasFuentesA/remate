class DomainsController < ApplicationController
  before_action :authenticate_user!

  def index
    @domains = Domain.all
  end

  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new(domain_params)
    @domain.save
    redirect_to domains_path
  end

  def show
      @domain = Domain.find(params[:id])
  end

  def edit
    @domain = Domain.find(params[:id])
  end


  private

  def domain_params
    params.require(:domain).permit(:type_modality,:inscription_id,:price,:date_posetion,:percentage)

  end



end
