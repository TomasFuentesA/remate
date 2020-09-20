class DomainRolsController < InheritedResources::Base

  private

    def domain_rol_params
      params.require(:domain_rol).permit(:type_member, :type_rol, :persona_id, :domain_id)
    end

end
