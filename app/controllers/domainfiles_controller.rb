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
      if params[:domainfile]
        @domainfile = Domainfile.new(domainfile_params)
        @domainfile.save
        @domain = Domain.find(params[:domainfile][:domain_id])
        redirect_to @domain
      else
        params[:domain_id].split.each do |id|
          Domainfile.create(domain_id: id, date: params[:date], obs_string: params[:obs_string], file_name: params[:file_name])
        end
      end
      
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
      if @domain.type_modality == "Creacion de empresa"
        @domain = Domain.where(type_modality: "Creacion de empresa", domainable_id: @domain.domainable_id)
        @domain.each do |dom|
          Domainfile.order(:id).each do |domf|
            if domf.domain_id == dom.id
              domf.destroy
            end
          end
        end      

      else
        @domainfile.destroy
        redirect_to @domain
      end
    end
  
    private
  
    def set_domainfile
      @domainfile = Domainfile.find(params[:id])
    end
  
    def domainfile_params
      if params[:domainfile]
        Rails.logger.info "Existe domainfile"
        params.require(:domainfile).permit(:domain_id, :date, :obs_string, :file_name )
      else
        Rails.logger.info "no"
        params.permit(:domain_id, :date, :obs_string, :file_name )
      end
    end
end
