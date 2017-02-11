class AdminController < ApplicationController
  before_action :authenticate

  def index
  end
  
  private
    ## Use callbacks to share common setup or constraints between actions.
    #def set_user
    #  @user = User.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password_digest)
    end  
end
