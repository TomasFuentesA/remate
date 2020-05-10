class PersonaMembersController < ApplicationController
  load_and_authorize_resource




  def new
    @persona_member = PersonaMember.new
  end

  def create
    @persona_member = PersonaMember.create(persona_member_params)
    if @persona_member.save
      respond_to do |format|
        format.js
        end
    end
  end



private
  def persona_member_params
    params.require(:persona_member).permit(:persona_id, :legal_persona_id)
  end




end
