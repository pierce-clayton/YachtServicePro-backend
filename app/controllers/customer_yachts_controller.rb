class CustomerYachtsController < ApplicationController
  before_action :set_customer_yacht, only: [:show, :edit, :update, :destroy]

  # GET /customer_yachts
  # GET /customer_yachts.json
  def index
    @customer_yachts = CustomerYacht.all
  end

  # GET /customer_yachts/1
  # GET /customer_yachts/1.json
  def show
  end

  # GET /customer_yachts/new
  def new
    @customer_yacht = CustomerYacht.new
  end

  # GET /customer_yachts/1/edit
  def edit
  end

  # POST /customer_yachts
  # POST /customer_yachts.json
  def create
    @customer_yacht = CustomerYacht.new(customer_yacht_params)

    respond_to do |format|
      if @customer_yacht.save
        format.html { redirect_to @customer_yacht, notice: 'Customer yacht was successfully created.' }
        format.json { render :show, status: :created, location: @customer_yacht }
      else
        format.html { render :new }
        format.json { render json: @customer_yacht.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_yachts/1
  # PATCH/PUT /customer_yachts/1.json
  def update
    respond_to do |format|
      if @customer_yacht.update(customer_yacht_params)
        format.html { redirect_to @customer_yacht, notice: 'Customer yacht was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_yacht }
      else
        format.html { render :edit }
        format.json { render json: @customer_yacht.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_yachts/1
  # DELETE /customer_yachts/1.json
  def destroy
    @customer_yacht.destroy
    respond_to do |format|
      format.html { redirect_to customer_yachts_url, notice: 'Customer yacht was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_yacht
      @customer_yacht = CustomerYacht.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_yacht_params
      params.require(:customer_yacht).permit(:customer_id, :yacht_id)
    end
end
