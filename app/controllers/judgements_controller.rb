class JudgementsController < ApplicationController
  def index
    @judgements = Judgement.all
  end

  def new

    @judgements = Judgement.new
  
  end



  private

  def judgements_params
    params.require(:judgement).permit(:type_judgement,
      :parts_attributes => [:id,:part1,:part2])

  end
end
