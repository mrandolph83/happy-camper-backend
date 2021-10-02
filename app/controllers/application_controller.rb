class ApplicationController < ActionController::API
 include ::ActionController::Cookies  
        def current_user
            
            User.find_by(id: session[:user_id])
    
        end 

        def logged_in?
            !!current_user 
        end

      
        def parse_results(result)
            id = find_id(result)
            name = find_name(result)
            description = find_description(result)
          
            
            city_state = find_address(result)
            activities = find_activities(result)
            # pictures = find_activities(result)
            byebug
            
        
            
         
            
        
           
            # activities (array)
            # url 
            # pictures
            
        end

        def find_id(result)
           
            result.each { |key, value| 
              if key != "RecAreaID"
              else
                id = value 
                return id  
              end   
              }      
        end

        def find_name(result)
            result.each { |key, value| 
                if key != "RecAreaName"
                else 
                name = value 
                return name  
              end   
              }      
        end

        def find_description(result)
            result.each { |key, value| 
                if key != "RecAreaDescription"
                else 
                description = value
                return description  
              end   
              }      
        end

    #  ADDRESS 

        def find_address(result)
            result.each { |key, value| 
            if key != "RECAREAADDRESS" 
            else 
               address_items = value[0]
               city = find_city(address_items)
               state = find_state(address_items)
            return "#{city}, #{state}"
            end
       }  
        end

        def find_city(address_items)
            address_items.each { |key, value| 
                if key != "City"
                else 
                city = value
                return city  
              end   
              }      
        end 

        def find_state(address_items)
            address_items.each { |key, value| 
                if key != "AddressStateCode"
                else 
                state = value
                return state  
              end   
              }      
        end 

        # ACTIVITIES
        def find_activities(result)
            activity_array = []
            result.each { |key, value| 
            if key != "ACTIVITY" 
            else 
               activities = value.each {|activity| puts activity 
               activity.each {|activity_objects, attributes| 
               if activity_objects != "ActivityName"
               else 
               activity_array << attributes
             end          
            }       
               }
                
            end
       }  
        activities = activity_array.join(', ')
        return activities
        end

        # def activity_parse(activity_items)
           
        #     activity_items.each { |activity| 
        #     activity.each {|key, value| 
        #     if key != "ActivityName"
        #     else 
        #     activity_array = []
        #     activity_array << value 
            
        #     end
            
        # }
        # activities = activity_array.each {|activity| puts activity}
        # return activities

        # } 
          
        # end 
        

           # Put everything you find into a "Results Array" after you find or create all of the elements. Then return that data with a .to_json method back
        
        
              
end
