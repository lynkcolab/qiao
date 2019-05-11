class Match < ApplicationRecord
  has_and_belongs_to_many :lunches, -> { distinct }
  has_and_belongs_to_many :users, -> { distinct }
end
