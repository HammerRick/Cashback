class Offer < ApplicationRecord
  has_many :offers_users, dependent: :destroy
  has_many :users, through: :offers_users

  validates :advertiser_name, uniqueness: true, presence: true
  validates :url, url: true
  validates :description, length: { maximum: 500 }

  attribute :enabled, :boolean, default: -> { false }
  attribute :premium, :boolean, default: -> { false }

  scope :enabled, -> { where(enabled: true) }
  scope :disabled, -> { where(enabled: false) }
  scope :premium, -> { where(premium: true) }

  def self.status_updater
    to_enable = Offer.disabled.where('starts_at < :now and ends_at > :now', now: Time.zone.now)
    to_enable.update_all(enabled: true)

    to_disable = Offer.enabled.where('ends_at < ?', Time.zone.now)
    to_disable.update_all(enabled: false)

    Rails.logger.info("#{to_enable.count} offers enabled, #{to_disable.count} offers disabled")
  end

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
