class UsersController < ApplicationController

  def show
    if current_user
      @user = User.new
    else
      redirect_to sign_in_path
    end
 end

 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
   if @user.save
     flash[:success] = "Welcome #{@user.name} to Memory Box"
     session[:user] = @user
     redirect_to user_path(@user)
   else
     render 'new'
   end
 end

 private

 def user_params
   params.require(:user).permit(:email, :name, :password, :password_confirmation)
 end
end

