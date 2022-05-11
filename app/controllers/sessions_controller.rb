class SessionsController < ApplicationController
    def create
        @user= User.new(session[:session_token])
        @user.reset_session_token!
        redirect_to users_url(:session_token)
        #takes to users show page
    end

    def new
        render :new
    end

    def destroy
        user = User.find()
        user.destroy
    end
end
#under sessions 
#create
#new 
#destroy 


#under user
#create
#new
#destroy