class CreateJoinTableUsersOffers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :offers do |t|
      t.index [:user_id, :offer_id]
    end
  end
end
