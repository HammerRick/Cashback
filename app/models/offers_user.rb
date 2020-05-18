class OffersUser < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :offer_id, uniqueness: { scope: :user }
end
