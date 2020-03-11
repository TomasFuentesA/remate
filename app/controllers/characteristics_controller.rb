class CharacteristicsController < ApplicationController
  def destroy
    @characteristics.destroy
  end
end
