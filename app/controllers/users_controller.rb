class UsersController < ApplicationController

  def index
    @user = User.all
  end 

  def show
    @user = User.find(params[:id])
    @children = @user.children
    @children_with_memories = @user.children_with_memories - @children  
  end

 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
   if @user.save
     flash[:success] = "Welcome #{@user.name} to Memory Box"
     redirect_to user_path(@user)
   else
     render 'new'
   end
 end

 def edit
  @user = User.find(params[:id])
 end 

 def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else 
      render :edit
    end
 end 

 def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to users_path
 end 

 private

 def user_params
   params.require(:user).permit(:email, :name, :password, :password_confirmation)
 end
end

