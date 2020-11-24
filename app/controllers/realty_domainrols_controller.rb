class RealtyDomainrolsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @realty_domainrols = RealtyDomainrol.all
  end
  
  def new
    @realty_domainrol = RealtyDomainrol.new
  end

  def show
  end
  
  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  private

    def realty_domainrol_params
      params.require(:realty_domainrol).permit(:type_member, :type_rol, :persona_id, :cantidad, :realty_domains_id, :percentage)
    end

end
