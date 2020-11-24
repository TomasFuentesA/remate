class RealtyDomainfilesController < InheritedResources::Base

  def new
    @realty_domainfile = RealtyDomainfile.new
  end

  def index
  end

  def create
    @realty_domainfile = RealtyDomainfile.new(realty_domainfile_params)
    if @realty_domainfile.save
      @realty_domain = RealtyDomain.find(@realty_domainfile.realty_domains_id)
      flash[:notice] = "Archivo agragado con exito"
      redirect_to @realty_domain
    end
  end

  def destroy
    @realty_domainfile = RealtyDomainfile.find(params[:id])
    @realty_domain = RealtyDomain.find(@realty_domainfile.realty_domains_id)
    @realty_domainfile.destroy
    redirect_to @realty_domain , notice: "Archivo eliminado con exito"
  end

  def update 
  end
  
  private

    def realty_domainfile_params
      begin
        params.require(:realty_domainfile).permit(:file_name, :observation, :realty_domains_id, :date)
      rescue => exception
        params.permit(:file_name, :observation, :realty_domains_id, :date)
      end
      
    end

end
