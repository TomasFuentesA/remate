class ActivitiesController < ApplicationController
  load_and_authorize_resource
  before_action :load_activityable

  def index
    @activities = @activityable.activities
  end

  def new
    @activity = @activityable.activities.new
  end

  def show
  end
  
  def create
    @activity = @activityable.activities.new(activity_params)
    if @activity.save
      redirect_to @activityable, notice: "Actividad añadida."
    else
      render :new
    end
  end
  def edit
    @activity = @activityable.activities.find(params[:id])
  end

  def update
    @activity.update(activity_params)
    redirect_to @activityable
  end
  def destroy
    @activity = @activityable.activities.find(params[:id])
    redirect_to @activityable
  end

    private
    def activity_params
      params.require(:activity).permit(:code,:name_activity,:afect_iva,:category,:activityable_type, :activityable_id ,:rubro)
    end

    def load_activityable
      klass = [LegalPersona, Persona].detect { |c| params["#{c.name.underscore}_id"]}
      @activityable = klass.find(params["#{klass.name.underscore}_id"])
    end
end
