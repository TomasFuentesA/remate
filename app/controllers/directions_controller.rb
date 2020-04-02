class DirectionsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :load_directionable


  def index
    @directions = @directionable.directions
  end

  def new
    @direction = @directionable.directions.new
  end

  def create
    @direction = @directionable.directions.new(direction_params)
    if @direction.save
      redirect_to [@directionable, :directions], notice: "Direciion Añadida."
    else
      render :new
    end
  end

    private
    def direction_params
      params.require(:direction).permit(:rut,:directiona, :directionb,:directionc)
    end

    def load_directionable
      klass = [LegalPersona, NaturalPersona].detect { |c| params["#{c.name.underscore}_id"]}
      @directionable = klass.find(params["#{klass.name.underscore}_id"])
    end

end
