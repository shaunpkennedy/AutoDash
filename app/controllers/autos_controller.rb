class AutosController < ApplicationController
  before_action :set_auto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate
  
  # GET /autos
  # GET /autos.json
  def index
    @autos = current_user.autos
  end

  # GET /autos/1
  # GET /autos/1.json
  def show
  end

  # GET /autos/new
  def new
    @auto = Auto.new
  end

  # GET /autos/1/edit
  def edit
  end

  # POST /autos
  # POST /autos.json
  def create
    @auto = Auto.new(auto_params)
    @auto.user = current_user
    
    respond_to do |format|
      if @auto.save
        format.html { redirect_to @auto, notice: 'auto was successfully created.' }
        format.json { render :show, status: :created, location: @auto }
      else
        format.html { render :new }
        format.json { render json: @auto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autos/1
  # PATCH/PUT /autos/1.json
  def update
    respond_to do |format|
      if @auto.update(auto_params)
        format.html { redirect_to @auto, notice: 'auto was successfully updated.' }
        format.json { render :show, status: :ok, location: @auto }
      else
        format.html { render :edit }
        format.json { render json: @auto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autos/1
  # DELETE /autos/1.json
  def destroy
    @auto.destroy
    respond_to do |format|
      format.html { redirect_to autos_url, notice: 'auto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto
      @auto = Auto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_params
      params.require(:auto).permit(:user_id, :title, :make, :model, :auto_year, :current_odometer, :oil_change_frequency, :tire_rotation_frequency)
    end
      
  private
    def login(username, password)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
    end

end
