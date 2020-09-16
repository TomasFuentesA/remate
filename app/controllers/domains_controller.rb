class DomainsController < ApplicationController
  load_and_authorize_resource
  before_action :display_values, only: [:show]
  before_action :load_domainable, only: [:new,:create]


  def new
    Rails.logger.info "test3"
    @domain = @domainable.domains.new
  end

  def index
    @domains = Domain.all
  end

  def create 
    Rails.logger.info "test2" 
    var = 0
    @domainable.domains.each do |dom| 
      var += dom.percentage
    end

    if (var + (params[:domain][:percentage]).to_i ) <= 100
      Rails.logger.info "var <= 100"
      @domain = @domainable.domains.new(domain_params)
      if @domain.save
        
        redirect_to @domainable, notice: "Dominio añadido!"
      else
        flash[:errors] = @domains.errors.full_messages
        redirect_to @domainable
      end
    else
      flash[:alert] = "El porcentaje de participacion excede el 100%"
      redirect_to @domainable      
    end  
  end

  
  def update
    Rails.logger.info "test4"
    @domain.update(domain_params)
    #redirect_to doamins_path
  end  

  def edit
    Rails.logger.info "test1"
    @domain = Domain.find(params[:id])
  end

  def show

  end

  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy
  end


private
  def display_values
    @able = @domain
    @type_modality = @able.type_modality
    @price = @able.price
    @date_posetion = @able.date_posetion
    @percentage = @able.percentage 
  end


  def domain_params
    params.require(:domain).permit(:type_modality,:inscription_id,:price,:date_posetion,:percentage)
  end

  def load_domainable
    klass = [LegalPersona].detect { |c| params["#{c.name.underscore}_id"]}
    @domainable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
