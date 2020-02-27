class LegalPeopleController < ApplicationController
  before_action :authenticate_user!
  def index
    @legalPeople = LegalPerson.all
  end


  private

  def legalPerson_params
    params.require(:legal_person).permit(:rut, :name, :fantasy_name,:alias,:web)

  end
end
