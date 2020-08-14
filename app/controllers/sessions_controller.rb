class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create
    def create 
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
            u.username = auth['info']['name']
            u.password = SecureRandom.hex(6)
        end
          session[:user_id] = @user.id
          create_passenger_if_none_redirect
    end 

private
 
    def auth
        request.env['omniauth.auth']
    end
end