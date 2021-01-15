class MarinasController < ApplicationController
  before_action :set_marina, only: [:show, :edit, :update, :destroy]

  # GET /marinas
  # GET /marinas.json
  def index
    @marinas = Marina.all
  end

  # GET /marinas/1
  # GET /marinas/1.json
  def show
  end

  # GET /marinas/new
  def new
    @marina = Marina.new
  end

  # GET /marinas/1/edit
  def edit
  end

  # POST /marinas
  # POST /marinas.json
  def create
    @marina = Marina.new(marina_params)

    respond_to do |format|
      if @marina.save
        format.html { redirect_to @marina, notice: 'Marina was successfully created.' }
        format.json { render :show, status: :created, location: @marina }
      else
        format.html { render :new }
        format.json { render json: @marina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marinas/1
  # PATCH/PUT /marinas/1.json
  def update
    respond_to do |format|
      if @marina.update(marina_params)
        format.html { redirect_to @marina, notice: 'Marina was successfully updated.' }
        format.json { render :show, status: :ok, location: @marina }
      else
        format.html { render :edit }
        format.json { render json: @marina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marinas/1
  # DELETE /marinas/1.json
  def destroy
    @marina.destroy
    respond_to do |format|
      format.html { redirect_to marinas_url, notice: 'Marina was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marina
      @marina = Marina.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def marina_params
      params.require(:marina).permit(:address_line_1, :address_line_2, :city, :state, :zip, :description)
    end
end
