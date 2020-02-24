class PassengersController < ApplicationController
    def index 
        @passengers = current_user.passengers
    end 

    def show
        # shows the flight the passenger chose through ticket
        @passenger = Passenger.find_by_id(params[:id])
    end

    def new
        # picking a flight
        @passenger = Passenger.new
    end

    def create
        @passenger = current_user.passengers.build(passenger_params)

        if @passenger.save
            redirect_to_index_if_passengers(@passenger)
        else 
            render :new 
        end
    end

    def edit
        # edit the flight and choose a different one
        @passenger = Passenger.find_by_id(params[:id])
    end

    def update
        @passenger = Passenger.find_by_id(params[:id])
        @passenger.update(passenger_params)
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

    def redirect_to_index_if_passengers(passenger)
        if current_user.passengers[1].nil?
            redirect_to passenger_path(passenger)
        else 
            redirect_to passengers_path
        end 
    end 

    def passenger_params
        params.require(:passenger).permit(:full_name, :age, :user_id)
    end
end
