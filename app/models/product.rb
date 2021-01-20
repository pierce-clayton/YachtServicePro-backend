class Product < ApplicationRecord
  belongs_to :user
  belongs_to :marina

  attr_accessor :stripe_product_id, :stripe_attributes, :images, :active


end
