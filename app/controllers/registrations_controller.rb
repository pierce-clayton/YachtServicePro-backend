class RegistrationsController < ApplicationController
  before_action :set_stripe_key
  def create
    if params[:user]
      user = User.create!(email: params[:user][:email],
                          password: params[:user][:password], 
                          password_confirmation: params[:user][:password_confirmation])
    else
       stripe_customer = Stripe::Customer.create(email: params[:customer][:email])
       customer = Customer.create!(email: params[:customer][:email],
                                   password: params[:customer][:password],
                                   password_confirmation: params[:customer][:password_confirmation],
                                   stripe_id: stripe_customer.id)
    end

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }, except: %i[password_digest created_at updated_at]
    elsif customer
      session[:customer_id] = customer.id
      render json: {
        status: :created,
        customer: customer
      }, except: %i[password_digest created_at updated_at]
    else
      render json: { status: 422 }
    end
  end

  private

  def set_stripe_key
    Stripe.api_key = 'sk_test_51I8VgBLQ8SRg06CGQYgJKACHjoPnXoN0pcNzoG3aCt4dXoDVJsMPL6HiYw0ISS8HGnx6hr3NGjbntXF5QTbFdqPW00idukCUXR'
  end
end