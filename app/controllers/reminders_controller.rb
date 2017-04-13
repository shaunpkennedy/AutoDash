class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  before_action :get_autos, only: [:new, :edit, :create, :update]
  before_action :get_servicetypes
  before_action :get_remindertypes
  before_action :authenticate  
  
  # GET /reminders
  # GET /reminders.json
  def index    
    @user = User.where(id: current_user.id)
    @autos = Auto.where(user_id: @user)
    @reminders = Reminder.where(auto_id: @autos)
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
  end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
  end

  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = Reminder.new(reminder_params)
	
    respond_to do |format|
      if @reminder.save
        format.html { redirect_to @reminder, notice: 'reminder was successfully created.' }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to @reminder, notice: 'reminder was successfully updated.' }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to reminders_url, notice: 'reminder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    
  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_params
      params.require(:reminder).permit(:auto_id, :service_type_id, :reminder_type_id, :miles, :time, :next_odometer, :notes, :completed_date)
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder
      @reminder = Reminder.includes(:service_type).find(params[:id])
    end

    def get_autos
     @autos = current_user.autos.collect{|a| [a.title, a.id] }
    end    

    def login(username, password)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
    end

    def get_servicetypes
      @service_types = ServiceType.all.collect{|s| [s.name, s.id] }
    end   

    def get_remindertypes
      @reminder_types = ReminderType.all.collect{|s| [s.name, s.id] }
    end    
      
end
