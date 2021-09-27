class CreateMinPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :min_prices do |t|
      t.integer :search_result_id
      t.date :date_departure
      t.time :hour
      t.integer :class_id
      t.string :class_name
      t.decimal :min_price
      t.string :buss_operator_name
      t.references :price_alert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
