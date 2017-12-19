class User < ApplicationRecord
  has_secure_password

  has_many :user_households
  has_many :households, through: :user_households
  has_many :user_chores
  has_many :chores, through: :user_chores
end
