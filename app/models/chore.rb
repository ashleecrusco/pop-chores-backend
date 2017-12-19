class Chore < ApplicationRecord
  belongs_to :household
  has_many :user_chores
  has_many :users, through: :user_chores
end
