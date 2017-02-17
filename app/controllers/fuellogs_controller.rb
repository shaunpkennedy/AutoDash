class FuellogsController < ApplicationController
  before_action :set_fuellog, only: [:show, :edit, :update, :destroy]
  before_action :get_autos, :only =>[:new, :edit, :create, :update]
  before_action :authenticate
  
  # GET /fuellogs
  # GET /fuellogs.json
  def index
    @user = User.where(id: current_user.id)
    @autos = Auto.where(user_id: @user)
    @fuellogs = Fuellog.where(auto_id: @autos)  
    #@fuellogs = Fuellog.all
  end

  # GET /fuellogs/1
  # GET /fuellogs/1.json
  def show
  end

  # GET /fuellogs/new
  def new
    @fuellog = Fuellog.new
  end

  # GET /fuellogs/1/edit
  def edit
  end

  # POST /fuellogs
  # POST /fuellogs.json
  def create
    @fuellog = Fuellog.new(fuellog_params)
	
    respond_to do |format|
      if @fuellog.save
        format.html { redirect_to @fuellog, notice: 'fuellog was successfully created.' }
        format.json { render :show, status: :created, location: @fuellog }
      else
        format.html { render :new }
        format.json { render json: @fuellog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fuellogs/1
  # PATCH/PUT /fuellogs/1.json
  def update
    respond_to do |format|
      if @fuellog.update(fuellog_params)
        format.html { redirect_to @fuellog, notice: 'fuellog was successfully updated.' }
        format.json { render :show, status: :ok, location: @fuellog }
      else
        format.html { render :edit }
        format.json { render json: @fuellog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuellogs/1
  # DELETE /fuellogs/1.json
  def destroy
    @fuellog.destroy
    respond_to do |format|
      format.html { redirect_to fuellogs_url, notice: 'fuellog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuellog
      @fuellog = Fuellog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fuellog_params
      params.require(:fuellog).permit(:log_date, :auto_id, :odometer, :ppg, :gallons, :total_cost)
    end
      
  def get_autos
   @autos = current_user.autos.collect{|a| [a.title, a.id] }
  end          
  
  private
    def login(username, password)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
    end

end
