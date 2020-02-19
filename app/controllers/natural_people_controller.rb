class NaturalPeopleController < ApplicationController
  load_and_authorize_resource
  def index
      @naturalPeople = NaturalPerson.all

  end


  private

  def natural_person_params
    params.require(:natural_person).permit(:rut, :name, :apellido_pat, :apellido_mat, :phone_id, :mail_id, :direction_id, :photo, :e_civil, :profesion, :fecha_nac, :alias, :nacionality, :passport, :job_id)
  end
end
