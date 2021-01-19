json.extract! product, :id, :user_id, :marina_id, :stripe_product_id, :active, :stripe_attributes, :description, :images, :name, :created_at, :updated_at
json.url product_url(product, format: :json)
