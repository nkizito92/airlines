class TicketsController < ApplicationController
    before_action :redirect_if_not_login
    before_action :sets_params, only: [:show, :edit, :destroy, :update]

    def index 
        if !params[:flight_id].nil?
            #find the flight
            #get the tickets aso
            @tickets = Flight.find_by_id(params[:flight_id]).tickets
        else 
             @tickets = Ticket.all
        end
    end 

    def show 
        redirect_if_wrong_id(@ticket, tickets_path)
    end 

    def expensive 
        @ticket = Ticket.expensive.first
        render :show
    end 

    def cheapest
        @ticket = Ticket.cheapest.first
        render :show
    end

    def expensive_tickets
        @tickets = Ticket.expensive_tickets
        render :index
    end

    def new 
        # buy a ticket with that has a specific time 
        @ticket = Ticket.new(flight_id: params[:flight_id])
    end 

    def create 
        @ticket = Ticket.new(params_pair)
        if @ticket.save
            redirect_to ticket_path(@ticket)
        else 
            render :new
        end
    end 

    def edit 
        redirect_if_wrong_id(@ticket, tickets_path)
    end 

    def update 
        @message = ""
        @ticket.update(passenger_id: params[:ticket][:passenger_id])         
        if @ticket.passenger.nil? 
            @message = "Please Choose a Passenger."
           render :edit
        elsif current_user.id != @ticket.passenger.user_id 
            redirect_to root_path
        else 
            redirect_to ticket_path(@ticket)
        end
    end

    def destroy
        # remove ticket or cancel it
        @ticket.passenger_id = nil
        @ticket.save
        redirect_to ticket_path(@ticket)
        # this part is only for admin
        # @ticket.delete_all
    end

    private 

    def sets_params
        @ticket = Ticket.find_by_id(params[:id])
    end 

    def params_pair
        params.require(:ticket).permit(:ticket_num, :seat_num, :price, :flight_id)
    end 

    # def ticket_order(.ordered)
    #     @tickets = Ticket.order(price: ordered).first
    #     render :index
    # end
end
