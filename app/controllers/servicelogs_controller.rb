class ServicelogsController < ApplicationController
  before_action :set_servicelog, only: [:show, :edit, :update, :destroy]
  before_action :get_autos, :only =>[:new, :edit, :create, :update]
  before_action :authenticate, :except => [:index, :show]
  
  # GET /servicelogs
  # GET /servicelogs.json
  def index
    @servicelogs = Servicelog.all
  end

  # GET /servicelogs/1
  # GET /servicelogs/1.json
  def show
  end

  # GET /servicelogs/new
  def new
    @servicelog = Servicelog.new
  end

  # GET /servicelogs/1/edit
  def edit
  end

  # POST /servicelogs
  # POST /servicelogs.json
  def create
    @servicelog = Servicelog.new(servicelog_params)
	
    respond_to do |format|
      if @servicelog.save
        format.html { redirect_to @servicelog, notice: 'servicelog was successfully created.' }
        format.json { render :show, status: :created, location: @servicelog }
      else
        format.html { render :new }
        format.json { render json: @servicelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicelogs/1
  # PATCH/PUT /servicelogs/1.json
  def update
    respond_to do |format|
      if @servicelog.update(servicelog_params)
        format.html { redirect_to @servicelog, notice: 'servicelog was successfully updated.' }
        format.json { render :show, status: :ok, location: @servicelog }
      else
        format.html { render :edit }
        format.json { render json: @servicelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicelogs/1
  # DELETE /servicelogs/1.json
  def destroy
    @servicelog.destroy
    respond_to do |format|
      format.html { redirect_to servicelogs_url, notice: 'servicelog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servicelog
      @servicelog = Servicelog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servicelog_params
      params.require(:servicelog).permit(:log_date, :auto_id, :odometer, :total_cost, :notes)
    end
      
  def get_autos
   @autos = Auto.all.collect{|a| [a.title, a.id] }
  end          
  
  private
    def login(username, password)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
    end

end
