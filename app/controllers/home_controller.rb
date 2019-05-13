class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to lunches_url
    else
      render "home/landing_page"
    end
  end
end