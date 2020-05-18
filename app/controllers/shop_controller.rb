class ShopController < ApplicationController
  def home
      @pagy, @offers = pagy(Offer.enabled.order(premium: :desc))
  end

  def click
    offer = Offer.find_by(id: params[:offer_id])
    user = current_user

    if offer
      if user && user.offers.exclude?(offer)
        user.offers << offer
      end

      redirect_to(offer.url) and return
    end

    redirect_back(fallback_location: root_path)
  end
end
