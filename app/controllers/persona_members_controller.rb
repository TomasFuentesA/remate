class PersonaMembersController < ApplicationController
  load_and_authorize_resource

  def new
    @persona_member = PersonaMember.new
  end

  def index
    @persona_members = PersonaMember.all
  end

  def create
    @persona_member = PersonaMember.create(persona_member_params)
    if @persona_member.save
      respond_to do |format|
        format.js
        end
    end
  end


  def edit
    @persona_member = PersonaMember.find(params[:id])
  end


  def update
    @persona_member.update(persona_member_params)
    redirect_to legal_personas_path
  end

  def destroy
    @persona_member.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to legal_personas_path, notice: "eliminado exitosamente" }
      format.json {head :no_content }
    end
  end

private
  def persona_member_params
    params.require(:persona_member).permit(:persona_id, :legal_persona_id, :percentage)
  end


end
