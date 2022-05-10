class UsersController < ApplicationController

    def index
        @users= User.all
        render :index
    end

     def show
        render :show
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Object successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :session_token, :password_digest)
    end

end
