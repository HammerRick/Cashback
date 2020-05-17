module OffersHelper

  def switch_option(enabled)
    if enabled
      'Disable'
    else
      'Enable'
    end
  end
end
