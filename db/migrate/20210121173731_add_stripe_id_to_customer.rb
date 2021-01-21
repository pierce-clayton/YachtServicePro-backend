class AddStripeIdToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :stripe_id, :string
  end
end
