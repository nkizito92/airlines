class FlightsController < ApplicationController

    def index
        # shows a list of different flights
        @flights = Airline.find_by_id(params[:airline_id]).flights
    end 

    def show
        #  shows the times of flight
        @flight = Flight.find_by_id(params[:id])
    end 

    
end
