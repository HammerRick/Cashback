class CreateOffersUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_users do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :offer, null: false, foreign_key: true, on_delete: :cascade

      t.index [:user_id, :offer_id], unique: true
      t.timestamps
    end
  end
end
