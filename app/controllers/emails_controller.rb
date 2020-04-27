class EmailsController < ApplicationController
  load_and_authorize_resource
  before_action :load_emailable

  def index
    @emails = @emailable.emails
  end

  def new
    @email = @emailable.emails.new
  end

  def create
    @email = @emailable.emails.new(email_params)
    if @email.save
      redirect_to @emailable, notice: "correo añadido."
    else
      render :new
    end
  end
  def edit
    @email = @emailable.emails.find(params[:id])
  end

  def update
    @email.update(email_params)
    redirect_to @emailable
  end
  def destroy
    @email = @emailable.emails.find(params[:id])
    redirect_to @emailable
  end

    private
    def email_params
      params.require(:email).permit(:email_a, :email_b,:email_c,:rut,:directionable_type, :directionable_id )
    end

    def load_emailable
      klass = [LegalPersona, Persona].detect { |c| params["#{c.name.underscore}_id"]}
      @emailable = klass.find(params["#{klass.name.underscore}_id"])
    end

end
