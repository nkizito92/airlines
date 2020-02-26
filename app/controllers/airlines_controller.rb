class AirlinesController < ApplicationController
    before_action :redirect_if_not_login
    def index 
        @airlines = Airline.all
    end 

    def show 
        @airline = Airline.find_by_id(params[:id])
    end
end
