class CheckoutSessionsController < ApplicationController
  before_action :set_checkout_session, only: [:show, :edit, :update, :destroy]
  before_action :set_stripe_key
  include CurrentUserConcern
  # GET /checkout_sessions
  # GET /checkout_sessions.json
  def index
    @checkout_sessions = CheckoutSession.all
  end

  # GET /checkout_sessions/1
  # GET /checkout_sessions/1.json
  def show
  end

  # GET /checkout_sessions/new
  def new
    @checkout_session = CheckoutSession.new
  end

  # GET /checkout_sessions/1/edit
  def edit
  end

  # POST /checkout_sessions
  # POST /checkout_sessions.json
  def create
    price_obj = Price.find_by!(stripe_id: checkout_session_params[:price_id])
    customer_obj = Customer.find_by!(stripe_id: checkout_session_params[:customer_id])
    @stripe_checkout_session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [...{price: price_obj[:stripe_id]}],
      mode: checkout_session_params[:stripe_mode],
      customer: customer_obj[:stripe_id],
      customer_email: customer_obj[:email],
      success_url: checkout_session_params[:success_url],
      cancel_url: checkout_session_params[:cancel_url]
      })
    
    @checkout_session = CheckoutSession.new(checkout_session_params)
    @checkout_session[:stripe_id] = @stripe_checkout_session['id']
    @checkout_session[:payment_intent] = @stripe_checkout_session['payment_intent']
    @checkout_session[:payment_status] = @stripe_checkout_session['payment_status']

    respond_to do |format|
      if @checkout_session.save!
        format.html { redirect_to @checkout_session, notice: 'Checkout session was successfully created.' }
        format.json { render :show, status: :created, location: @checkout_session }
      else
        format.html { render :new }
        format.json { render json: @checkout_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkout_sessions/1
  # PATCH/PUT /checkout_sessions/1.json
  def update
    respond_to do |format|
      if @checkout_session.update(checkout_session_params)
        format.html { redirect_to @checkout_session, notice: 'Checkout session was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkout_session }
      else
        format.html { render :edit }
        format.json { render json: @checkout_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkout_sessions/1
  # DELETE /checkout_sessions/1.json
  def destroy
    @checkout_session.destroy
    respond_to do |format|
      format.html { redirect_to checkout_sessions_url, notice: 'Checkout session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_checkout_session
    @checkout_session = CheckoutSession.find(params[:id])
  end

  def set_stripe_key
    Stripe.api_key = 'sk_test_51I8VgBLQ8SRg06CGQYgJKACHjoPnXoN0pcNzoG3aCt4dXoDVJsMPL6HiYw0ISS8HGnx6hr3NGjbntXF5QTbFdqPW00idukCUXR'
  end

  # Only allow a list of trusted parameters through.
  def checkout_session_params
    params.require(:checkout_session).permit(:price_id, :customer_id, :stripe_mode, :success_url, :cancel_url, :payment_intent, :payment_status,:stripe_id)
  end
end
