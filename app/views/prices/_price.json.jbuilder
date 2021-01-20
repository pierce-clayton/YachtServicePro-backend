json.extract! price, :id, :product_id, :unit_amount, :stripe_type, :recurring_interval, :recurring_count, :stripe_id, :created_at, :updated_at
json.url price_url(price, format: :json)
