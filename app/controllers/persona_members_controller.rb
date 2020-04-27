class PersonaMembersController < ApplicationController
  


  def new
    @legalpersona = LegalPersona.find(params[:legal_persona])
    @personas = Persona.all
  end
  def create
    @persona_members = PersonaMember.create(persona_id: persona.id, legal_persona: legalpersona.id)
    if @persona_members.save
      flash[:notice] = "persona #{persona.rut} añadida con exito"
      redirect_to @legalpersona
    end
  end



  private


end
