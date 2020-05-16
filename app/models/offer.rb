# frozen_string_literal: true

class Offer < ApplicationRecord
  has_and_belongs_to_many :users

  validates :advertiser_name, uniqueness: true, presence: true
  validates :url, url: true
  validates :description, length: { maximum: 500 }

  attribute :enabled, :boolean, default: -> { false }
  attribute :premium, :boolean, default: -> { false }

  # gives 'https://' to url if needed
  def url=(url_str)
    unless url_str.blank?
      unless url_str.split(':')[0] == 'http' || url_str.split(':')[0] == 'https'
        url_str = 'https://' + url_str
      end
    end
    write_attribute :url, url_str
  end
end
