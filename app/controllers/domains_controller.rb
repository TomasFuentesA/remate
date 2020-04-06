class DomainsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :load_domainable

  def index
    @domains = @domainable.domains
  end

  def new
    @domain = @domainable.domains.new
  end

  def create
    @domain = @domainable.domains.new(domain_params)
    if @domain.save
      redirect_to [@domainable, :domains], notice: "Dominio Añadida."
    else
      render :new
    end
  end

  def show
      @domain = Domain.find(params[:id])
  end

  def edit
    @domain = @domainable.domains.find(params[:id])
  end

  def destroy
    @domain = Domain.find(params[:id])
    if @domain.present?
      @domain.destroy
    end
    redirect_to domains_path, notice: "Dominio eliminada!"
  end


  private

  def domain_params
    params.require(:domain).permit(:type_modality,:inscription_id,:price,:date_posetion,:percentage)

  end
  def load_domainable
    klass = [LegalPersona, Persona].detect { |c| params["#{c.name.underscore}_id"]}
    @domainable = klass.find(params["#{klass.name.underscore}_id"])
  end



end
