class PricesController < ApplicationController
  before_action :get_product
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  # GET /prices
  # GET /prices.json
  def index
    @prices = @product.prices
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
  end

  # GET /prices/new
  def new
    @price = @product.prices.build
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  # POST /prices.json
  def create
    @price = @product.prices.build(price_params)

    respond_to do |format|
      if @price.save
        format.html { redirect_to product_prices_path(@product), notice: 'Price was successfully created.' }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :new }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html { redirect_to product_prices_path(@product), notice: 'Price was successfully updated.' }
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :edit }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price.destroy
    respond_to do |format|
      format.html { redirect_to product_prices_path(@product), notice: 'Price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def get_product
    @product = Product.find(params[:product_id])
  end

  def set_price
    @price = @product.prices.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def price_params
    params.require(:price).permit(:product_id, :unit_amount, :stripe_type, :recurring_interval, :recurring_count, :stripe_id)
  end
end