class FlightsController < ApplicationController
    before_action :redirect_if_not_login
    def index
        # shows a list of different flights
        if !params[:airline_id].nil?
         @flights = Airline.find_by_id(params[:airline_id]).flights
        else
            @flights = Flight.all
        end
    end 

    def show
        #  shows the times of flight
        @flight = Flight.find_by_id(params[:id])
        if !@flight.nil?
            @tickets = @flight.tickets
        elsif !params[:airline_id].nil? 
            redirect_to root_path
        end
    end 

    def expensive 
        @flight = Flight.find_by_id(params[:airline_id])
        @tickets = Ticket.expensive.first
        render :show
    end 

    def cheapest
        @flight = Flight.find_by_id(params[:airline_id])
        @tickets = Ticket.cheapest.first
        render :show
    end
    
end
