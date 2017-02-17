class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_user_autos
  protect_from_forgery with: :exception
  before_action :set_default_title

  def set_default_title
    @title = "Auto Dashboard"
  end      
  
  private
  

    
    ###def authenticate
    ###  ###if user = authenticate_with_http_basic {|user, password| User.authenticate(user, password)}
    ###  ### session[:user_id] = user.id
    ###  ### session[:logged_in] = true
    ###  ###else
    ###  ### request_http_basic_authentication
    ###  ###end
    ###end
    
  helper_method :logged_in?
  helper_method :log_in
  
  def logged_in?
    #session[:logged_in]
    !current_user.nil?
  end
  
  def log_in(user)
    session[:user_id] = user.id
    session[:logged_in] = true
  end  
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end
  
  def current_user_autos
    @current_user_autos ||= User.includes(:autos).find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end
  
  def authenticate
    redirect_to '/login' unless current_user
  end 

end

