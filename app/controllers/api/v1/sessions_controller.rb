class Api::V1::SessionsController < ApplicationController

    def create 
       @user = User.find_by(username: params[:session][:username])

       if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        render json: @user
        
       else
        render json: {
            error: "Invalid Username and/or Password"
        }

    end
end

end
