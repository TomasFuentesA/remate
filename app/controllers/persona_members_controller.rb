class PersonaMembersController < ApplicationController
  before_action :get_legalpersona
  before_action :legal_persona_id
  def new
    @personas = Persona.all


  end
  def create
    @persona_members = PersonaMember.create(persona: @legalpersona)
    if @persona_members.save
      flash[:notice] = "persona #{persona.rut} añadida con exito"
      redirect_to persona_path
    end
  end

  def index

  end


  private
  def get_legalpersona
    @legal_persona = params[:legal_persona].classify.constantize.find(legal_persona_id)
  end
  def legal_persona_id
    params[(params[:legal_persona].singularize + "_id").to_sym]
  end


end
