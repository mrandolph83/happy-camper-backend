class ApplicationController < ActionController::API
 include ::ActionController::Cookies  
        def current_user
            User.find(session[:user_id])
        end 

        def logged_in?
            !!current_user 
        end

        def get_current_user
            if logged_in?
                render json: current_user
            else 
                render json: ("No one logged in")
            end 
        end 
    
end
