class DomainsController < ApplicationController
  load_and_authorize_resource
#  has_one :inscriptions

  def index
    @domains = Domain.all
  end

  def show
    @domain = Domain.find(params[:id])
  end

  def edit
    @domain = Domain.find(params[:id])
  end

  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new(domain_params)
    if @domain.save
      redirect_to domain_path
    else
      render "new"
    end
  end

  def destroy
    @domain = Domain.find(params[:id])
    if @domain.present?
      @domain.destroy
    end
    redirect_to domains_path, notice: "Dominio eliminado!"
  end

  def domain_params
    params.require(:domain).permit(:type_modality,:inscription_id,:price,:date_posetion,:percentage)
  end
end
