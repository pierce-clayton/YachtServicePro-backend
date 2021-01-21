class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]
  before_action :set_stripe_key
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    render json: @customer, include: :yachts, except: %i[created_at updated_at password_digest]
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @stripe_customer = Stripe::Customer.create(email: customer_params[:email])
    @customer = Customer.new(customer_params)
    @customer[:stripe_id] = @stripe_customer['id']

    respond_to do |format|
      if @customer.save!
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_stripe_key
      Stripe.api_key = 'sk_test_51I8VgBLQ8SRg06CGQYgJKACHjoPnXoN0pcNzoG3aCt4dXoDVJsMPL6HiYw0ISS8HGnx6hr3NGjbntXF5QTbFdqPW00idukCUXR'
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:email, :password, :password_confirmation)
    end
end
