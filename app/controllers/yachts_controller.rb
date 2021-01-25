class YachtsController < ApplicationController
  before_action :set_yacht, only: [:show, :edit, :update, :destroy]
  include CurrentUserConcern

  # GET /yachts
  # GET /yachts.json
  def index
    @yachts = Yacht.all
  end

  # GET /yachts/1
  # GET /yachts/1.json
  def show
  end

  # GET /yachts/new
  def new
    @yacht = Yacht.new
  end

  # GET /yachts/1/edit
  def edit
  end

  # POST /yachts
  # POST /yachts.json
  def create
    @yacht = Yacht.new(yacht_params)

    respond_to do |format|
      if @yacht.save
        CustomerYacht.find_or_create_by(yacht: @yacht, customer: @current_user)
        format.html { redirect_to @yacht, notice: 'Yacht was successfully created.' }
        format.json { render :show, status: :created, location: @yacht }
      else
        format.html { render :new }
        format.json { render json: @yacht.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yachts/1
  # PATCH/PUT /yachts/1.json
  def update
    respond_to do |format|
      if @yacht.update(yacht_params)
        format.html { redirect_to @yacht, notice: 'Yacht was successfully updated.' }
        format.json { render :show, status: :ok, location: @yacht }
      else
        format.html { render :edit }
        format.json { render json: @yacht.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yachts/1
  # DELETE /yachts/1.json
  def destroy
    @yacht.destroy
    respond_to do |format|
      format.html { redirect_to yachts_url, notice: 'Yacht was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yacht
      @yacht = Yacht.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def yacht_params
      params.require(:yacht).permit(:name, :length, :sail, :registration_number, :marina_id)
    end
end
