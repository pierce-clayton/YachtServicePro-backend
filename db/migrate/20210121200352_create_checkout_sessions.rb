class CreateCheckoutSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :checkout_sessions do |t|
      t.references :price, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :stripe_mode
      t.string :success_url
      t.string :cancel_url
      t.string :payment_intent
      t.string :payment_status

      t.timestamps
    end
  end
end
