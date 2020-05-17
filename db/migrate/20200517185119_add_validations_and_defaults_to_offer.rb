class AddValidationsAndDefaultsToOffer < ActiveRecord::Migration[6.0]
  def change
    change_table :offers do |t|
      t.change :advertiser_name, :string, null: false, index: true
      t.change :description, :text, limit: 500
      t.change :enabled, :boolean, default: false
      t.change :premium, :boolean, default: false

      t.index :advertiser_name, unique: true
    end
  end
end