class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.save
  end


end
