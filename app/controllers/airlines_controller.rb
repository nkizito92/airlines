class AirlinesController < ApplicationController
    before_action :redirect_if_not_login
    def index 
        # displays airlines to choose from
        @airlines = Airline.all
    end 

    def show 
        # display flights in this airline
        @airline = Airline.find_by_id(params[:id])
    end
end
