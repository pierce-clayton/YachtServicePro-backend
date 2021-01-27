class PricesController < ApplicationController
  before_action :get_product
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  before_action :set_stripe_key
  include CurrentUserConcern


  # POST /prices
  # POST /prices.json
  def create
    if %w[day week month year].include?(price_params[:recurring_interval])
      @stripe_price = Stripe::Price.create(product: @product.stripe_product_id,
                                           unit_amount: price_params[:unit_amount].to_i,
                                           currency: 'usd',
                                           recurring: { 
                                            interval: price_params[:recurring_interval],
                                            interval_count: price_params[:recurring_count].to_i
                                                      })
    else
      @stripe_price = Stripe::Price.create(product: @product.stripe_product_id,
                                           unit_amount: price_params[:unit_amount].to_i,
                                           currency: 'usd')
    end

    @price = @product.prices.build(price_params)
    @price[:stripe_id] = @stripe_price['id']
    @price[:stripe_type] = @stripe_price['type']

    if @price.save!
      render json: @product, include: :prices
    else
      render json: {errors: 'there was an error'}
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

  def set_stripe_key
    Stripe.api_key = 'sk_test_51I8VgBLQ8SRg06CGQYgJKACHjoPnXoN0pcNzoG3aCt4dXoDVJsMPL6HiYw0ISS8HGnx6hr3NGjbntXF5QTbFdqPW00idukCUXR'
  end

  # Only allow a list of trusted parameters through.
  def price_params
    params.require(:price).permit(:product_id, :unit_amount, :stripe_type, :recurring_interval, :recurring_count, :stripe_id)
  end
end
