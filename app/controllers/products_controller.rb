class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_stripe_key
  include CurrentUserConcern
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @stripe_product = Stripe::Product.create({name: product_params[:name], description: product_params[:description]})
    @product = Product.new(product_params)
    @product[:stripe_product_id] = @stripe_product.id
    @product[:stripe_attributes] = @stripe_product.attributes
    @product[:images] = @stripe_product.images
    @product[:active] = true

    respond_to do |format|
      if @product.save!
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
  def set_stripe_key
    Stripe.api_key = 'sk_test_51I8VgBLQ8SRg06CGQYgJKACHjoPnXoN0pcNzoG3aCt4dXoDVJsMPL6HiYw0ISS8HGnx6hr3NGjbntXF5QTbFdqPW00idukCUXR'
  end
  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:user_id, :marina_id, :stripe_product_id, :active, :stripe_attributes, :description, :images, :name)
  end
end
