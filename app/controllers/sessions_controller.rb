class SessionsController < ApplicationController
    def create
        @user= User.new(session[:session_token])
        @user.reset_session_token!
        redirect_to users_url(:session_token)
    end

    def destroy
        user = User.find()
        user.destroy
    end
end
