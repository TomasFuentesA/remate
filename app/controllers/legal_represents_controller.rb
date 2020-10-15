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
