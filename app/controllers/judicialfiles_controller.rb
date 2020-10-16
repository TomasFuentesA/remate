class JudicialfilesController < ApplicationController

    load_and_authorize_resource
    before_action :set_judicialfile, only:  [:show,:edit]
  
    def index
      @judicialfiles = Judicialfile.order("id").page(params[:page]).per_page(10)
    end
  
    def new
      @judgement_id=params['format']
      @judicialfile = Judicialfile.new
    end
  
    def create
      @auctions_id=params['format']
      @judicialfile = Judicialfile.new(judicialfile_params)
      @judicialfile.save
      @judgement_id=params['judicialfile']['judgement_id'].to_i
      if @auctions_id
        redirect_to auction_path(@auctions_id)
      else
        redirect_to judgement_path(@judgement_id)
      end
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
      @judgement_id=Judicialfile.find(params[:id]).judgement_id
      @judicialfile.destroy
      redirect_to judgement_path(@judgement_id)
    end
  
    private
  
    def set_judicialfile
      @judicialfile = Judicialfile.find(params[:id])
    end
  
    def judicialfile_params
      params.require(:judicialfile).permit(:judgement_id, :date, :obs, :file_name )
  
    end
  
  end
  
