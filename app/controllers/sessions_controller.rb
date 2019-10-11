class SessionsController < ApplicationController
    def new
        if current_user
          redirect_to '/'
        else
          @user = User.new
        end
      end
    
      def create 
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          @user.save
          session[:user] = @user
          redirect_to root_path
        else
          redirect_to sign_up_path
        end
      end

      def destroy
        session[:user] = nil
        redirect_to root_path
      end
    
      private
    
    
      def session_params
        params.require(:user).permit(:email, :password)
      end

end
