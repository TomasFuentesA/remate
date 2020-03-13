class JudgementsController < ApplicationController
  def index
    @judgements = Judgement.all
  end

  def new
    @judgements = Judgement.new
  end



  private

  def judgements_params
    params.require(:judgement).permit(:name,:part1, :part2,
      :court_attributes => [:id,:name,:adress,:rut,:phone,:account,:email])

  end
end
