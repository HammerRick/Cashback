module ApplicationHelper
  include Pagy::Frontend

  # def embedded_svg(filename, options = {})
  #   assets = Rails.application.assets || Rails.application.config.assets
  #   file = assets.find_asset(filename).source.force_encoding("UTF-8")
  #   doc = Nokogiri::HTML::DocumentFragment.parse file
  #   svg = doc.at_css "svg"
  #   if options[:class].present?
  #     svg["class"] = options[:class]
  #   end
  #   raw doc
  # end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice then "alert-info"
    when :success then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-danger"
    else "alert-#{flash_type}"
    end
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end
end
