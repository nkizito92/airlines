class UsersController < ApplicationController
    protect_from_forgery
    
    def index 
        redirect_if_not_login
         @user = User.find_by_id(session[:user_id])
    end 

    def login
    end 

    def loggedin
        @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
       else 
            redirect_to login_path
       end
    end
    
    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        return redirect_to signup_path unless @user.save
        session[:user_id] = @user.id 
        redirect_to root_path
        # @new_user = User.new(username: params[:username], password: params[:password])
        # @old_user = User.all.find_by(username: params[:username])
        # if @new_user.valid? && !@old_user
        #     @new_user.username = params[:username].downcase
        #     @new_user.save
        #     session[:user_id] = @new_user.id
        #     redirect_to root_path
        # else 
        #     redirect_to signup_path
        # end
    end

    def destroy 
        session.delete :user_id
        redirect_to login_path
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end 

end
