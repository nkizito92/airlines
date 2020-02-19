class PassengersController < ApplicationController
    def show
        # shows the flight the passenger chose through ticket
        @passenger = Passenger.find_by_id(params[:id])
    end

    def new
        # picking a flight
        @passenger = Passenger.new
    end

    def create
        # adding the flight to 
        # needs fixing
        @passenger = Passenger.create(full_name: params[:passenger][:full_name], age: params[:passenger][:age])
        @ticket = Ticket.find_by_id(params[:passenger][:tickets])
        @passenger.tickets << @ticket
        @passenger.save
        redirect_to passenger_path(@passenger)
    end

    def edit
        # edit the flight and choose a different one
    end

    def update
        # update flight
    end

    def destroy
        # remove the flight for this passanger
    end

    private

    def passenger_params
        params.require(:passenger).permit(:full_name, :age, :tickets)
    end
end
