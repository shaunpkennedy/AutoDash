class ApplicationController < ActionController::Base

  helper_method :current_user

  protect_from_forgery with: :exception
  
  before_action :set_default_title

  def set_default_title
    @title = "Auto Dashboard"
  end      
  
  private
  
    def authenticate
      if user = authenticate_with_http_basic {|user, password| User.authenticate(user, password)}
       session[:user_id] = user.id
       session[:logged_in] = true
      else
       request_http_basic_authentication
      end
    end
    
  helper_method :logged_in?
  
  def logged_in?
    session[:logged_in]
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end

