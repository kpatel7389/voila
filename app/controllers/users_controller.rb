class UsersController < ApplicationController
  def new
    @user = User.new
    @masters = User.where(master: true)
  end

  def create
    @user = User.new(user_params)

    if @user.check_master(user_params[:secret])
      @user.master = true
    end

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

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:stage_name, :secret, :email, :password)
  end
end
