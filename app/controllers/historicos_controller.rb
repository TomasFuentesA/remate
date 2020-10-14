class HistoricosController < InheritedResources::Base

  def new
  end

  def index
  end

  def create
  end
  
  def update
  end

  def destroy
  end

  private

    def historico_params
      params.require(:historico).permit(:persona_id, :type_member, :legal_persona_id, :entrada, :salida)
    end

end
