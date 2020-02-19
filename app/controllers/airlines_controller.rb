class AirlinesController < ApplicationController

    def index 
        # displays airlines to choose from
        redirect_if_not_login
        @user = current_user
        @airlines = Airline.all
    end 

    def show 
        # display flights in this airline
        redirect_if_not_login
        @airline = Airline.find_by_id(params[:id])
    end
end
