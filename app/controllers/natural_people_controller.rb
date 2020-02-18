class NaturalPeopleController < ApplicationController
  def index
    @natural_people = NaturalPerson.all
  end

  def new
    @natural_people = NaturalPerson.new
  end

  def edit
    @natural_people = NaturalPerson.find(params[:id])
  end


  def create
    @natural_people = NaturalPerson.new(natural_person_params)
    @natural_people.save
    redirect_to natural_people_path
  end


  def show
    @natural_people = NaturalPerson.find(params[:id])

  end

  def update
    @natural_people.update(natural_person_params)
    redirect_to natural_people_path
  end

  def destroy
    @natural_people.destroy
    redirect_to natural_people_path
  end


  private
  def natural_person_params
<<<<<<< HEAD
    params.require(:natural_people).permit(:rut,:name, :apellido_pat, :apellido_mat, :phone_id, :mail_id, :direction_id, :photo, :e_civil, :profesion, :fecha_nac, :alias, :nacionality, :passport, :job_id)
=======
    params.require(:natural_person).permit(:rut, :name, :apellido_pat, :apellido_mat, :phone_id, :mail_id, :direction_id, :photo, :e_civil, :profesion, :fecha_nac, :alias, :nacionality, :passport, :job_id)
>>>>>>> personaNatural
  end


end
