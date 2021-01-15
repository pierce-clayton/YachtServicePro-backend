class RegistrationsController < ApplicationController
  def create
    if params[:user]
      user = User.create!(email: params[:user][:email],
                          password: params[:user][:password], 
                          password_confirmation: params[:user][:password_confirmation])
    else
       customer = Customer.create!(email: params[:customer][:email],
                                   password: params[:customer][:password],
                                   password_confirmation: params[:customer][:password_confirmation])
    end

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }, except: %i[password_digest created_at updated_at]
    elsif customer
      session[:user_id] = customer.id
      render json: {
        status: :created,
        customer: customer
      }, except: %i[password_digest created_at updated_at]
    else
      render json: { status: 422 }
    end
  end
end