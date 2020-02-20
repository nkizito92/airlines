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
        @passenger = Passenger.create(passenger_params)
        @passenger.user_id = current_user.id
        @passenger.save
        redirect_to passenger_path(@passenger)
    end

    def edit
        # edit the flight and choose a different one
        @passenger = Passenger.find_by_id(params[:id])
    end

    def update
        @passenger = Passenger.find_by_id(params[:id])
        # update flight
    end

    def destroy
        @passenger = Passenger.find_by_id(params[:id])
        if current_user.id == @passenger.user_id
            @passenger.delete_all
        end
        redirect_to root_path
    end

    private

    def passenger_params
        params.require(:passenger).permit(:full_name, :age)
    end
end
