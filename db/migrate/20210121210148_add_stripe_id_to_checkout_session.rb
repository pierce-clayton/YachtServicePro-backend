class AddStripeIdToCheckoutSession < ActiveRecord::Migration[6.1]
  def change
    add_column :checkout_sessions, :stripe_id, :string
  end
end
