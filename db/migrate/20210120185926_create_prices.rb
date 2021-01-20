class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :unit_amount
      t.string :stripe_type
      t.string :recurring_interval
      t.integer :recurring_count
      t.string :stripe_id

      t.timestamps
    end
  end
end
