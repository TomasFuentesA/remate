class LegalRepresentsController < ApplicationController
    load_and_authorize_resource

    before_action :legal_represents_params, only: :create

    def index
    end

    def new
        @legalrepresent = LegalRepresent.new
    end

    def create
        @legal_persona = LegalPersona.find(params[:legal_persona_id])
        params[:persona_id].each do |representante|
            if representante != ""
                repres = LegalRepresent.where(persona_id: representante, legal_persona_id: params[:legal_persona_id])
                if repres.length == 0
                    LegalRepresent.create(persona_id: representante.to_i, legal_persona_id: params[:legal_persona_id], type_represents: params[:type_represents], entrada: params[:entrada])           
                end               
            end               
        end
        flash[:notice] = "Representante(s) legal(es) añadido(s) con éxito"
        redirect_to @legal_persona    
        #@legalpersona = LegalPersona.find(params[:legal_persona_id])
        #@legalrepresent = LegalRepresent.new(legal_represents_params)
        #if @legalrepresent.save
        #    redirect_to @legalpersona
        #  else
        #    render :json => { :errors => @legalrepresent.errors.full_messages }
        #end
    end

    def destroy
        @legalrepresent = LegalRepresent.find(params[:id])
        @legal_persona = LegalPersona.find(@legalrepresent.legal_persona_id)
        RepresentanteHistorico.create(persona_id: @legalrepresent.persona_id, entrada: @legalrepresent.entrada, salida: Time.new.strftime("%Y-%m-%d"), legal_persona_id: @legalrepresent.legal_persona_id)
        @legalrepresent.destroy
        respond_to do |format|
            format.js
            format.html {redirect_to @legal_persona, notice: "Representante legal eliminado!" }
            format.json {head :no_content }        
        end
    end

    def edit
    end

    def update
    end


    private

    def legal_represents_params
        params.permit(:persona_id, :legal_persona_id, :type_represents, :entrada)
    end
    

end
