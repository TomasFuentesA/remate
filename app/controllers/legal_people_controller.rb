class LegalPeopleController < ApplicationController
  def index
    @legalPeople = LegalPerson.all
  end


  private

  def legalPerson_params
    params.require(:legal_person).permit(:rut, :name, :fantasy_name,:alias,:web)

  end
end
