class SessionsController < ApplicationController
    def new
    end
  
    # def create
    #  user = User.find_by(email: params[:session][:email].downcase)
    #  if user && user.authenticate(params[:session][:password])
    #   session[:user_id] = user.id
    #   redirect_to user 
    #  else 
    #   render :new
    #  end 
    # end

    def create
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
   
      session[:user_id] = @user.id
   
      render 'pages/home'
    end
   
    private
   
    def auth
      request.env['omniauth.auth']
    end
  
    def destroy
      session[:user_id] = nil 
      redirect_to root_path
    end
    
  

end
