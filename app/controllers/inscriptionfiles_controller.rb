class InscriptionfilesController < ApplicationController
    load_and_authorize_resource
    before_action :set_inscriptionfile, only:  [:show,:edit]
  
    def index
      @inscriptionfiles = Inscriptionfile.all
    end
  
    def new
      @inscriptionfile = Inscriptionfile.new
    end
  
    def create
      @inscriptionfile = Inscriptionfile.new(inscriptionfile_params)
      @inscriptionfile.save
      redirect_to inscriptionfiles_path
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @inscriptionfile.update(inscriptionfile_params)
      redirect_to inscriptionfiles_path
    end
  
  
  
    def destroy
      @inscriptionfile.destroy
      redirect_to inscriptionfiles_path
    end
  
    private
  
    def set_inscriptionfile
      @inscriptionfile = Inscriptionfile.find(params[:id])
    end
  
    def inscriptionfile_params
      params.require(:inscriptionfile).permit(:inscription_id, :date, :obs, :file_name )
  
    end
end
