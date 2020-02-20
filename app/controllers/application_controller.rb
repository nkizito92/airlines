class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    
    private 

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by_id(session[:user_id])
    end
    
    def redirect_if_not_login
        redirect_to login_path unless logged_in?
    end 
end
