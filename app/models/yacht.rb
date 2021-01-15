class Yacht < ApplicationRecord
  belongs_to :marina

  has_many :customer_yachts
  has_many :customers, through: :customer_yachts
end
