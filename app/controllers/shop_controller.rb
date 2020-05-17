class ShopController < ApplicationController
  def home
      @pagy, @offers = pagy(Offer.enabled)
  end
end
