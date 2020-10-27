class RubrosController < InheritedResources::Base

  def new
  end

  def index
  end

  def edit
  end

  def destroy
  end


  private

    def rubro_params
      params.require(:rubro).permit(:nombre)
    end

end
