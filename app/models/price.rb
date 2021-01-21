class Price < ApplicationRecord
  belongs_to :product
  has_many :checkout_sessions
end
