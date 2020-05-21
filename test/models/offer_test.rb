require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  VALID_OFFER_HASH = {
    advertiser_name: 'WellMartin',
    url: 'this.is.a.url',
    description: 'a' * 500
  }.freeze

  INVALID_OFFER_HASH = {
    advertiser_name: 'WellMartin',
    url: 'this is not.a.url',
    description: 'a' * 501
  }.freeze

  test 'create valid offer' do  
    offer = Offer.create(VALID_OFFER_HASH)
    assert offer.valid? == true
  end

  test 'create invalid offer' do
    offer = Offer.create(VALID_OFFER_HASH)
    offer = Offer.create(INVALID_OFFER_HASH)

    expected_errors = {
      advertiser_name: ['has already been taken'],
      url: ['is not a valid URL'],
      description: ['is too long (maximum is 500 characters)']
    }

    assert offer.valid? == false
    assert offer.errors.messages == expected_errors
  end
end
