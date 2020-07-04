class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    
    if @user.save
      flash[:success]= 'ユーザを登録しました'
      redirect_to @user
    else
      flash.now[:danger]='ユーザの登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def user_param
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
