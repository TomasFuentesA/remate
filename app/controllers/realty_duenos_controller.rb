class RealtyDuenosController < InheritedResources::Base

  def index
    @realtyduenos = RealtyDueno.all
  end

  def new
  end

  def show
  end
  
  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def realty_dueno_params
      params.require(:realty_dueno).permit(:persona_id, :realty_id, :type_member, :entrada)
    end

end
