class FlightsController < ApplicationController

    def index
        # shows a list of different flights
        @flights = Flight.all
    end 

    def show
        #  shows the times of flight
        @flight = Flight.find_by_id(params[:id])
    end 

    
end
