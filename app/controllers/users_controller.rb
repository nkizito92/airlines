class UsersController < ApplicationController
    protect_from_forgery

    before_action :redirect_if_logged_in, only: [:login, :new]
    
    def index 
        redirect_if_not_login
         @user = User.find_by_id(session[:user_id])
    end 

    def login
    end 

    def loggedin
        @invalid = ""
        @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            create_passenger_if_none_redirect
        else 
            @invalid = "Invalid Username or Password!"
            render :login
       end
    end
    
    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        return render :new unless @user.save
        session[:user_id] = @user.id 
        create_passenger_if_none_redirect
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
