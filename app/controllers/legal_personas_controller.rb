class LegalPersonasController < ApplicationController
  def index
    @legalPersonas = LegalPersona.all 
  end
end
