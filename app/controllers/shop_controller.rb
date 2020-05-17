class ShopController < ApplicationController
  def home
      @pagy, @offers = pagy(Offer.enabled.order(premium: :desc))
  end
end
