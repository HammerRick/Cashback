class User < ApplicationRecord
  has_many :offers_users, dependent: :destroy
  has_many :offers, through: :offers_users

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
