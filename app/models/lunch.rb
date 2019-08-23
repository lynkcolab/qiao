class Lunch < ApplicationRecord
  has_and_belongs_to_many :users, -> { distinct }
  has_and_belongs_to_many :matches, -> { distinct }

  def self.match
    next_lunch_start = Date.current.next_week(:thursday) + 12.hours
    lunch = self.includes(:users).find_by(start: next_lunch_start)
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
  end

  def self.fake
    Lunch.create!
  end

end
