class RegistrationsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    @user = User.new(user_params)
  end
  
  def update
    if @user.update_without_password(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def update_resource(resource, params)
    resource.update_without_current_password(params) 
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar )
    end
    
  def after_update_path_for(resource)
    user_path(@user.id)
  end 
  
  def after_sign_in_path_for(resource)
    blogs_path
  end
end