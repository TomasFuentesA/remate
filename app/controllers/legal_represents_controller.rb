class LegalRepresentsController < ApplicationController
    load_and_authorize_resource

    before_action :legal_represents_params, only: :create

    def index
    end

    def new
        @legalrepresent = LegalRepresent.new
    end

    def create
        @legalpersona = LegalPersona.find(params[:legal_persona_id])
        @legalrepresent = LegalRepresent.new(legal_represents_params)
        if @legalrepresent.save
            redirect_to @legalpersona
          else
            render :json => { :errors => @legalrepresent.errors.full_messages }
        end
    end

    def destroy
    end

    def edit
    end

    def update
    end


    private

    def legal_represents_params
        params.permit(:name, :rut, :legal_persona_id)
    end
    

end
