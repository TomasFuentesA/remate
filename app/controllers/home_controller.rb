class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index], raise: false


  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
  end
end
