class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :air_flights
    
    private 

    def air_flights
        @flight = rand(Airline.all.count)
        if @flight == 0 || @flight.nil?
            @flight = rand(Airline.all.count)+1
        end 
    end 

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by_id(session[:user_id])
    end
    
    def redirect_if_not_login
        redirect_to login_path, alert: "Please login first" unless logged_in?
    end 

    def redirect_if_logged_in
        redirect_to root_path unless !logged_in?
    end

    def create_passenger_if_none_redirect
        if @user.passengers.empty? 
            redirect_to new_passenger_url, alert: "Please create a passenger."
        else
            redirect_to root_path
        end
    end
end
