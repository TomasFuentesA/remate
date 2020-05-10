class CharacteristicsController < ApplicationController
  load_and_authorize_resource
  def destroy
    @characteristics.destroy
  end
end
