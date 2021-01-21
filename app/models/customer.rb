class Customer < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :customer_yachts, dependent: :destroy
  has_many :yachts, through: :customer_yachts
end
