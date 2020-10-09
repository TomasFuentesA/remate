class LegalMembersController < ApplicationController
  load_and_authorize_resource

  def index
    @legal_members = LegalMember.all

  end

  def new
    @persona_member = LegalMember.new
  end

  def edit
    @legal_member = LegalMember.find(params[:id])
  end

  def create
    @legal_member = LegalMember.create(legal_member_params)
    if @legal_member.save
      respond_to do |format|
        format.js
        end
    end
  end

  def update
    @legal_member.update(legal_member_params)
    redirect_to legal_personas_path
  end

  def destroy
    @legal_member.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to legal_personas_path, notice: "eliminado exitosamente" }
      format.json {head :no_content }
    end
  end

  private
  def legal_member_params
    params.require(:legal_member).permit(:legal_persona_id, :legal_asociado_id, :percentage)
  end
end