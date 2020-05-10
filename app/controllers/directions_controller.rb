class DirectionsController < ApplicationController
  load_and_authorize_resource
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
      redirect_to @directionable, notice: "Dirección Añadida."
    else
      render :new
    end
  end

  def edit
    @direction = @directionable.directions.find(params[:id])
  end

  def update
    @direction.update(direction_params)
    redirect_to @directionable
  end

private
    def direction_params
      params.require(:direction).permit(:directiona, :directionb,:directionc,:rut)
    end

    def load_directionable
      klass = [LegalPersona, Persona].detect { |c| params["#{c.name.underscore}_id"]}
      @directionable = klass.find(params["#{klass.name.underscore}_id"])
    end

end
