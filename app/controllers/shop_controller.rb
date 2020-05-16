class ShopController < ApplicationController
  def home
      @offers = Offer.where(enabled: true)
  end
end
