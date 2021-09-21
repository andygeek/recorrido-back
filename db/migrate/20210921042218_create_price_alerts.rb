class CreatePriceAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :price_alerts do |t|
      t.string :name
      t.integer :origin_id
      t.integer :destiny_id
      t.integer :class_id
      t.decimal :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
