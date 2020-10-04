class LegalRepresentsController < ApplicationController
    load_and_authorize_resource

    def index
    end

    def new
        @legalrepresent = LegalRepresent.new
    end

    def create
        @legalpersona = LegalPersona.find(params[:legal_personas_id])
        @legalrepresent = LegalRepresent.new(legal_represents_params)
        @legalrepresent.save
        redirect_to @legalpersona
    end

    def destroy
    end

    def edit
    end

    def update
    end


    private

    def legal_represents_params
        params.require(:legal_represent).permit(:name, :rut, :legal_personas_id)
    end
    

end
