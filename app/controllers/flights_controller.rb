class FlightsController < ApplicationController
    before_action :redirect_if_not_login
    def index
        # shows a list of different flights
        @flights = Airline.find_by_id(params[:airline_id]).flights
    end 

    def show
        #  shows the times of flight
        @flight = Flight.find_by_id(params[:id])
        @tickets = @flight.tickets
    end 

    def expensive 
        scope_date(:desc)
    end 

    def cheapest
        scope_date(:asc)
    end

    private 

    def scope_date(prices)
        @flight = Flight.find_by_id(params[:airline_id])
        @tickets = @flight.tickets.order(price: prices).first
        render :show
    end

    
end
