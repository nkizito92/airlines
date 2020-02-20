class TicketsController < ApplicationController

    before_action :sets_params, only: [:show, :edit, :destroy, :update]

    def index 
        @tickets = Ticket.all
    end 

    def show 
        # show the ticket, with seat_num, flight, and passanger 
    end 

    def new 
        # buy a ticket with that has a specific time 
        @ticket = Ticket.new
    end 

    def create 
        # add ticket to passanger
        @ticket = Ticket.new(params_pair)
        @ticket.save
    end 

    def edit 
        # choose different time for the same ticket
    end 

    def update 
        # updates ticket
        @ticket.update(seat_num: params[:seat_num])
        @ticket.save
    end

    def destroy
        # remove ticket or cancel it
        @ticket.delete_all
    end

    private 

    def sets_params
        @ticket = Ticket.find_by_id(params[:id])
    end 

    def params_pair
        params.require(:ticket).permit(:ticket_num, :seat_num, :price)
    end 
end
