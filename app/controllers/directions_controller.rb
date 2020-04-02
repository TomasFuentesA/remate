class DirectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_directionable
  def index
    @directions = @directionable.directions
  end

  def new
    @direction = @directionable.directions.new
  end

  def create
    @email = @emailable.emails.new(email_params)
    if @email.save
      redirect_to [@emailable, :emails], notice: "correo añadido."
    else
      render :new
    end
  end

    private
    def email_params
      params.require(:email).permit(:email_a, :email_b,:email_c,:rut)
    end

    def load_emailable
      klass = [LegalPersona, NaturalPersona].detect { |c| params["#{c.name.underscore}_id"]}
      @emailable = klass.find(params["#{klass.name.underscore}_id"])
    end

end
