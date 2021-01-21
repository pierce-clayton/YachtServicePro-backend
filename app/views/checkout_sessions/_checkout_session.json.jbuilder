json.extract! checkout_session, :id, :price_id, :customer_id, :stripe_mode, :success_url, :cancel_url, :payment_intent, :payment_status, :created_at, :updated_at
json.url checkout_session_url(checkout_session, format: :json)
