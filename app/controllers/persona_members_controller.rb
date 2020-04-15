class PersonaMembersController < ApplicationController
  def create
    @persona_members = PersonaMember.create(persona: persona)
    if @persona_members.save
      flash[:notice] = "persona #{persona.rut} añadida con exito"
      redirect_to persona_path
    end
  end

end
