class JudgementsController < ApplicationController
  load_and_authorize_resource
  def index
    @judgements = Judgement.all
  end

  def new
    @judgements = Judgement.new
  end



  private

  def judgement_params
    params.require(:judgement).permit(:type_judgement,
      :parts_attributes => [:id,:part1,:part2])

  end
end
