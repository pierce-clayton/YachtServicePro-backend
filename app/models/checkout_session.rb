class CheckoutSession < ApplicationRecord
  belongs_to :price
  belongs_to :customer
end
