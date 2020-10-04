class PersonaMembersController < ApplicationController
  load_and_authorize_resource

  def new
    @legal_persona = LegalPersona.find(params['legal_persona_id'])
    @persona_members = PersonaMember.new
  end

  def index
    @persona_members = PersonaMember.all
  end


  def create
    @domain_rol = DomainRol.find(params[:domain_rol_id])
    Rails.logger.info params


    @personamember = PersonaMember.where(persona_id: params[:persona_member][:persona_id], type_member: params[:persona_member][:type_member], legal_persona_id: params[:legal_persona_id])
    var = 0
    PersonaMember.order(:id).each do |personam|
      if personam.legal_persona_id == params[:persona_member][:legal_persona_id]
        var += personam.percentage
      end
    end
    
    if (var + (params[:persona_member][:percentage]).to_i) <= 100
      Rails.logger.info "var <= 100"
      
      if @personamember.length == 0
        @persona_member = PersonaMember.create(persona_member_params)      
        if @persona_member.save
          Rails.logger.info "Save"
          flash[:notice] =  "ingresado exitosamente"
          @legal_persona = LegalPersona.find(params[:persona_member][:legal_persona_id])
          redirect_to @legal_persona
        else
          Rails.logger.info "Else 1"
          Rails.logger.info @persona_member.errors.full_messages.to_s
          flash[:errors] = @persona_member.errors.full_messages
        end
      else
        flash[:alert] = "La persona ya esta ingresada"
      end  
    else
      Rails.logger.info "Else 2"
      flash[:alert] = "El porcentaje de participacion excede el 100%"
      @persona_member.errors.add(:percentage, "Cantidad invalida")
      #redirect_to legal_personas_path
    end
  end

  def edit
    @persona_member = PersonaMember.find(params[:id])
  end


  def update
    var = 0
    legal_aux = 0
    @persona_member = PersonaMember.find(params[:id])

    PersonaMember.order(:id).each do |personam|
      if personam.id == @persona_member.id
        legal_aux = personam.legal_persona_id
      end
    end
    

    PersonaMember.order(:id).each do |personam|
      if personam.legal_persona_id == legal_aux && personam.id != @persona_member.id       
        var += personam.percentage
        Rails.logger.info var
      end
    end

    Rails.logger.info params[:persona_member][:percentage]
    Rails.logger.info 'final: ' + (var + params[:persona_member][:percentage].to_i).to_s
    if (var.to_f + (params[:persona_member][:percentage]).to_f) <= 100
      Rails.logger.info "var <= 100"
      @persona_member.update(persona_member_params)
        
      if @persona_member.save
        Rails.logger.info "Save"
        flash[:notice] =  "Editado exitosamente"
        @legal_persona = LegalPersona.find(params[:persona_member][:legal_persona_id])
    
        redirect_to @legal_persona
  
      else
        Rails.logger.info "Else 1"
        Rails.logger.info @persona_member.errors.full_messages.to_s
        flash[:errors] = @persona_member.errors.full_messages
      end
    else
      Rails.logger.info "Else 2"
      flash[:alert] = "El porcentaje de participacion excede el 100%"
      @persona_member.errors.add(:percentage, "Cantidad invalida")
      #redirect_to legal_personas_path
    end
    
    
  end

  def destroy
    @legal_persona = LegalPersona.find(@persona_member.legal_persona_id)
    @persona_member.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to @legal_persona, notice: "eliminado exitosamente" }
      format.json {head :no_content }
    end
  end
 
 


private
  def persona_member_params

    params.require(:persona_member).permit(:persona_id, :legal_persona_id, :type_member ,:percentage, :acciones)
    
  end  


end
