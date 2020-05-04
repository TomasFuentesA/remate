class LegalMembersController < ApplicationController
  load_and_authorize_resource

  def index
    @legal_members = LegalMember.all

  end

  def new
    @persona_member = LegalMember.new
  end

  def create
    @legal_member = LegalMember.create(legal_member_params)
    if @legal_member.save
      respond_to do |format|
        format.js
        end
    end
  end

  def destroy
  end
end




  private
  def legal_member_params
    params.require(:legal_member).permit(:legal_persona_id,:legal_asociado_id)
  end
