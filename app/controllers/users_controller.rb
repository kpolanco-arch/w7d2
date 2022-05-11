class UsersController < ApplicationController

    
      def new
          @user = User.new
          render :new
      end
      
   

    def show
        @user = User.find(params[:id])
        render :show
    end
    
    
    def create
       @user = User.new(user_params)
    if @user.save 
      login(@user)
      redirect_to user_url(@user.id)
    else
      # render json: @user.errors.full_messages, status: 422
      flash.now[:errors] = @user.errors.full_messages
      render :new
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
