class CreatePriceAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :price_alerts do |t|
      t.string :name
      t.integer :origin_id
      t.string :origin_name
      t.string :origin_url_name
      t.integer :destiny_id
      t.string :destiny_name
      t.string :destiny_url_name
      t.integer :class_id
      t.decimal :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
