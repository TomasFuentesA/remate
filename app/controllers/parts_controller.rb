class PartsController < ApplicationController

  def parts_params
    params.require(:part).permit(:id,:name)
  end
end
