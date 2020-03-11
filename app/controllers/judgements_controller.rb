class JudgementsController < ApplicationController
  def index
  end

  def new
    2.times do
      @judgement.parts.build
    end
  end
end
