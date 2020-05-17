namespace :offers do
  desc "Updates the 'enabled' collumn acording to star_at end end_at collumns"
  task update_status: :environment do
    Offer.status_updater
  end
end
