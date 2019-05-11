class LunchesController < ApplicationController
  def index
  end

  def create
    next_lunch_start = Date.current.next_week(:thursday) + 12.hours
    @lunch = Lunch.find_or_create_by(start: next_lunch_start)
    @lunch.users << current_user unless @lunch.users.include?(current_user)
    @lunch.save
    redirect_to lunches_path
  end
end
