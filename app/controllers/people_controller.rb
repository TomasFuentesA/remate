class PeopleController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource
  def index
    @people = Person.all
  end

  def edit
  end

  def create
    @people = Person.new(person_params)
    @people.save
    redirect_to people_path
  end

  def show
  end

  def new
    @people = Person.new
  end

  def update
    @people.update(person_params)
  end

private

  def person_params
    params.require(:person).permit(:rut, :name, :name2, :last_name1, :last_name2, :photo, :e_civil, :profesion, :nacionality, :passport,:job_id,:actividad_id)
  end
end
