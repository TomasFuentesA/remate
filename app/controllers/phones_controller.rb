class PhonesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_phoneable


  def index
    @phones = @phoneable.phones
  end

  def new
    @phone = @phoneable.phones.new
  end

  def create
  @phone = @phoneable.phones.new(phone_params)
  if @phone.save
    redirect_to [@phoneable, :phones], notice: "telefono añadido."
  else
    render :new
  end
end

  private
  def phone_params
    params.require(:phone).permit(:phone_a, :phone_b,:phone_c,:rut)
  end

  def load_phoneable
    klass = [LegalPersona, NaturalPersona].detect { |c| params["#{c.name.underscore}_id"]}
    @phoneable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
