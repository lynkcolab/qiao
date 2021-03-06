class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :department

  has_and_belongs_to_many :lunches, -> { distinct }
  has_and_belongs_to_many :matches, -> { distinct }
end
