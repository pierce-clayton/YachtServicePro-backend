class CreateCustomerYachts < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_yachts do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :yacht, null: false, foreign_key: true

      t.timestamps
    end
  end
end
