class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create
    def create 
        # pp request.env['omniauth.auth']

        # session[:name] = request.env['omniauth.auth']['info']['name']
        # session[:omniauth_data] = request.env['omniauth.auth']
        @user = User.find_or_create_by(username: auth['info']['name']) do |u|
            u.username = auth['info']['name']
          end
          binding.pry
       
          session[:user_id] = @user.id
          
          render 'airlines/index'
    end 

private
 
    def auth
        request.env['omniauth.auth']
    end
end