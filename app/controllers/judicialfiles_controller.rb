class JudicialfilesController < ApplicationController

    load_and_authorize_resource
    before_action :set_judicialfile, only:  [:show,:edit]
  
    def index
      @judicialfiles = Judicialfile.all
    end
  
    def new
      @judicialfile = Judicialfile.new
    end
  
    def create
      @judicialfile = Judicialfile.new(judicialfile_params)
      @judicialfile.save
      redirect_to judicialfiles_path
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @judicialfile.update(judicialfile_params)
      redirect_to judicialfiles_path
    end
  
  
  
    def destroy
      @judicialfile.destroy
      redirect_to judicialfiles_path
    end
  
    private
  
    def set_judicialfile
      @judicialfile = Judicialfile.find(params[:id])
    end
  
    def judicialfile_params
      params.require(:judicialfile).permit(:judgement_id, :date, :obs, :file_name )
  
    end
  
  end
  
