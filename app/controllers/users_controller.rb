class UsersController < ApplicationController
    def index 
        redirect_if_not_login
         @user = User.find_by_id(session[:user_id])
    end 

    def login
        @user = User.find_by(username: params[:username])
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
        @new_user = User.new(username: params[:username], password: params[:password])
        @old_user = User.all.find_by(username: params[:username])
        if @new_user.valid? && !@old_user
            @new_user.username = params[:username].downcase
            @new_user.save
            session[:user_id] = @new_user.id
            redirect_to root_path
        else 
            redirect_to signup_path
        end

        #     @user = User.new(username: params[:username], password: params[:password])
        #     @user.save
        #     session[:user_id] = @user.id
        # # else 
        #     redirect_to root_path
        # # end
    end

    def destroy 
        session.delete :user_id
        redirect_to login_path
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end 

end
