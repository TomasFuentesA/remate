class EconomicActivitiesController < ApplicationController
  



    load_and_authorize_resource


    def index
      @economicactivities = EconomicActivity.all
    end

    def new
      @economic_activity = EconomicActivity.new
    end

    def create
      @economic_activity = EconomicActivity.new(economic_activity_params)
      if @economic_activity.save
        redirect_to economic_activities_path
      else
        puts @economic_activity.inspect


      end


    end

    def show
    end

    def edit
    end

    def destroy
      @economicactivity.destroy
      redirect_to economic_activities_path
    end

    private

    def set_economicactivity
      @economic_activity = EconomicActivity.find(params[:id])
    end

    def economic_activity_params
      params.require(:economic_activity).permit(:legal_persona_id, :name, :codigo, :afecta_iva )

    end



end
