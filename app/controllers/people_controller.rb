class PeopleController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @peoples = People.all
  end

  def new
    @people = People.new
  end

  def create
    @people = People.new(people_params)
    @people.save
    redirect_to peoples_path
  end

  def show
  end

  def edit
  end

  def update
    @people.update(people_params)
    redirect_to peoples_path
  end

  def destroy
    @people.destroy
    redirect_to peoples_path
  end


private

  def people_params
    params.require(:people).permit(:name, :rut, :actividad_id, :last_name1, :last_name2, :phone_id, :mail_id, :photo, :e_civil, :profesion, :birth_date, :nacionality, :passport, :job_id)
  end

end
