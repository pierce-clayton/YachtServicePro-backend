class Product < ApplicationRecord
  has_many :prices, dependent: :destroy
  belongs_to :user
  belongs_to :marina
end
