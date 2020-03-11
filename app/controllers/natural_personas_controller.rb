class NaturalPersonasController < ApplicationController
  def index
    @naturalPersonas = NaturalPersona.all 
  end
end
