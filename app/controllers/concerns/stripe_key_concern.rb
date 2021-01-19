module StripeKeyConcern
  extend ActiveSupport::Concern
  included do
    before_action :set_stripe_key
  end

  def set_stripe_key
    Stripe.api_key = 'sk_test_51I8VgBLQ8SRg06CGQYgJKACHjoPnXoN0pcNzoG3aCt4dXoDVJsMPL6HiYw0ISS8HGnx6hr3NGjbntXF5QTbFdqPW00idukCUXR'
  end
end