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

    var = 0
    PersonaMember.order(:id).each do |personam|
      if personam.legal_persona_id == params[:persona_member][:legal_persona_id]
        var += personam.percentage
      end
    end
    
    if (var + (params[:persona_member][:percentage]).to_i) <= 100
      @persona_member = PersonaMember.create(persona_member_params)
      Rails.logger.info "var <= 100"  
      if @persona_member.save
        Rails.logger.info "Save"
        flash[:notice] =  "ingresado exitosamente"
  
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

  def edit
    @persona_member = PersonaMember.find(params[:id])
  end


  def update
    @persona_member.update(persona_member_params)
    redirect_to legal_personas_path
  end

  def destroy
    @persona_member.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to legal_personas_path, notice: "eliminado exitosamente" }
      format.json {head :no_content }
    end
  end
 
 


private
  def persona_member_params

    params.require(:persona_member).permit(:persona_id, :legal_persona_id, :type_member ,:percentage)
    
  end  


end
