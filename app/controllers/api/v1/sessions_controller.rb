class Api::V1::SessionsController < ApplicationController

    def create 
       @user = User.find_by(username: params[:session][:username])
        
       if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        render json: UserSerializer.new(@user), status: :ok
       else
        render json: {
            error: "Invalid Username and/or Password"
        }
        end
    end

    def get_current_user
        
        if logged_in?
            current_user = User.find(cookies[:current_user_id])
            byebug
            render json: UserSerializer.new(current_user)
           
        else
            render json: {
                error: "Get Current User"
            }
        end
    end 

    def destroy
        session.clear
        render json: {
            notice: "Logged out"
        }
    end 

end
