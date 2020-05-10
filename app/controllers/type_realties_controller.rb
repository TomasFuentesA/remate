class TypeRealtiesController < ApplicationController
  load_and_authorize_resource
  def destroy
    @type_realties.destroy
  end
end
