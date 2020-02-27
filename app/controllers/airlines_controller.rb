class AirlinesController < ApplicationController
    before_action :redirect_if_not_login
    def index 
        @airlines = Airline.all
    end 

    def show 
        @airline = Airline.find_by_id(params[:id])
        redirect_if_wrong_id(@airline, root_path)
    end
end
