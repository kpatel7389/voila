class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def new_master
    @user = User.new
  end



  private
  def user_params
    params.require(:user).permit(:stage_name, :email, :password)
  end
end