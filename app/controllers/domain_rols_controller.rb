class DomainRolsController < InheritedResources::Base

  def index
    @domain_rols = DomainRol.all
  end

  def new
    @domain_rol = DomainRol.new
  end
  private

    def domain_rol_params
      params.require(:domain_rol).permit(:type_member, :type_rol, :persona_id, :domain_id)
    end

end
