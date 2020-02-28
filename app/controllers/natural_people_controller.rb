class NaturalPeopleController < ApplicationController
  before_action :authenticate_user!
  def index
    @naturalPeople = NaturalPerson.all
  end

  def naturalPerson_params
    params.require(:natural_person).permit(:rut, :name, :apellido_pat,:apellido_mat)

  end
end
