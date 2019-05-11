class LunchesController < ApplicationController
  before_action :authenticate_user!

  def index
    next_lunch_start = Date.current.next_week(:thursday) + 12.hours
    # user = User.includes(:matches => :lunches).find(current_user.id)
    matches = Match.joins(:users,:lunches).where("(users.id = ?) AND (lunches.start = ?)", current_user.id, next_lunch_start)
    if (matches.count == 1)
      @users = User.joins(:matches).where("(matches.id = ?) AND (users.id != ?)", matches[0].id, current_user.id)
    end
  end

  def create
    next_lunch_start = Date.current.next_week(:thursday) + 12.hours
    @lunch = Lunch.includes(:users).find_or_create_by(start: next_lunch_start)
    @lunch.users << current_user unless @lunch.users.include?(current_user)
    @lunch.save

    redirect_to lunches_path
  end

  def match
    next_lunch_start = Date.current.next_week(:thursday) + 12.hours
    lunch = Lunch.includes(:users).find_by(start: next_lunch_start)
    users = lunch.users.dup.shuffle

    if users.count >= 2
      lunch.matches.delete_all

      users.each do |u1|
        match = Match.new
        match.lunches << lunch unless match.lunches.include?(lunch)

        users.delete(u1)
        match.users << u1 unless match.users.include?(u1)

        u2 = users.sample
        users.delete(u2)
        match.users << u2 unless match.users.include?(u2)

        # if only one user left
        if users.count == 1
          u3 = users.last
          puts u3
          users.delete(u3)
          match.users << u3 unless match.users.include?(u3)
        end

        puts match
        match.save
      end
    end

    redirect_to lunches_path
  end

end
