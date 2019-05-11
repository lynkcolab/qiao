class Lunch < ApplicationRecord
  has_and_belongs_to_many :users, -> { distinct }
  has_and_belongs_to_many :matches, -> { distinct }
end
