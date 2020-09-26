class DomainfilesController < ApplicationController
    load_and_authorize_resource
    before_action :set_domainfile, only:  [:show,:edit]
  
    def index
      @domainfiles = Domainfile.all
    end
  
    def new
      @domainfile = Domainfile.new
    end
  
    def create
      @domainfile = Domainfile.new(domainfile_params)
      @domainfile.save
      @domain = Domain.find(params[:domainfile][:domain_id])
      redirect_to @domain
    end
  
    def show
    end
  
    def edit
    end
  
    def update

      @domainfile.update(domainfile_params)
      redirect_to domainfiles_path
    end
  
  
  
    def destroy
      @domain = Domain.find(@domainfile.domain_id)
      @domainfile.destroy
      redirect_to @domain
    end
  
    private
  
    def set_domainfile
      @domainfile = Domainfile.find(params[:id])
    end
  
    def domainfile_params
      params.require(:domainfile).permit(:domain_id, :date, :obs_string, :file_name )
  
    end
end
