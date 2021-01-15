class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    if params[:user]
      user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
    else
      customer = Customer.find_by(email: params[:customer][:email]).try(:authenticate, params[:customer][:password])
    end

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }, except: %i[password_digest created_at updated_at]
    elsif customer
      session[:user_id] = customer.id
      render json: {
        status: :created,
        logged_in: true,
        customer: customer
      }, except: %i[password_digest created_at updated_at]
    else
      render json: { status: 401 }
    end

  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }, except: %i[password_digest created_at updated_at]
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end
  
end