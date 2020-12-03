class DocumentsController < ApplicationController
  
    load_and_authorize_resource 

    def index 
        @documents = Document.order("id").page(params[:page]).per_page(10)
    end
  
    def new 
        @fromRealtyId = params['format']?params['format']:'' 
        @document = Document.new
        @document.realty_id = @fromRealtyId   
    end
  
    def create 
        @realty_id = params['document']['fromRealtyId']
        @document = Document.new(document_params)
        if @document.save
          if @realty_id != ""
            redirect_to realty_path(@realty_id)
          else
            redirect_to documents_path, notice: "Documentación Ingresada"
          end
        else
          render :json => { :errors => @document.errors.full_messages }
        end
    end
  
    def show
        @document = Document.all
        @document = Document.find(params[:id])
    end
  
    def edit
        @document = Document.all
        @document = Document.find(params[:id])
    end
  
    def update 
        @document.update(document_params)
        redirect_to @document
    end
  
    def destroy 
        @document.destroy
        respond_to do |format|
          format.js
          format.html {redirect_to @document, notice: "Estudio eliminado exitosamente" }
          format.json {head :no_content }
        end
    end

    private

    def document_params
        params.require(:document).permit(:domain_title, :gp, :tax_appraisal, :realty_id)
    end

  end
  