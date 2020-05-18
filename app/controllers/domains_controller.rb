class DomainsController < ApplicationController
  load_and_authorize_resource
  before_action :set_domain, only: [:edit,:show,:destroy]
  before_action :display_values, only: [:show]


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

  def edit
    
  end

  def show

  end

  def destroy
    @domain.delete
    redirect_to domains_path, notice: "Dominio eliminado!"
  end


private
  def display_values
    @able = @domain
    @type_modality = @able.type_modality
    @price = @able.price
    @date_posetion = @able.date_posetion
    @percentage = @able.percentage 
  end

  def set_domain
    @domain = Domain.find(params[:id])

  end

  def domain_params
    params.require(:domain).permit(:type_modality,:inscription_id,:price,:date_posetion,:percentage)
  end
end
