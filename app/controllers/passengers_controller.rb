class PassengersController < ApplicationController
    before_action :redirect_if_not_login
    before_action :finds_passenger, only: [:show, :edit, :update, :destroy]
    def index 
        @passengers = current_user.passengers
    end 

    def show
        redirect_if_wrong_id(@passenger, passengers_path)
    end

    def new
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
        redirect_if_wrong_id(@passenger, passengers_path)
    end

    def update
        @passenger.update(passenger_params)
        redirect_to passenger_path(@passenger)
    end

    def destroy
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

    def finds_passenger 
        @passenger = Passenger.find_by_id(params[:id])
    end 

    def passenger_params
        params.require(:passenger).permit(:full_name, :age, :user_id)
    end
end
