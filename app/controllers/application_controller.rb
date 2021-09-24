class ApplicationController < ActionController::API
   
        def current_user
            # mocked version of logging in
        User.first
        end 

        def logged_in?
            !!current_user 
        end
    
end
