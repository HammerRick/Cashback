class User < ApplicationRecord
  has_and_belongs_to_many :offers
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
