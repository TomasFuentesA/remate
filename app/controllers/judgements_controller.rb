class JudgementsController < ApplicationController
  def index
    @judgements = Judgement.all
  end

  def new
    @judgements = Judgement.new

    2.times do
      @judgement.parts.build
    end
  end



  private

  def judgements_params
    params.require(:judgement).permit()

  end
end
