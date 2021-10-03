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
            latitude = find_latitude(result)
            longitude = find_longitude(result)
            url = find_url(result)
            activities = find_activities(result)
    
            pictures = find_pictures(result)
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
            address_items.each { |key, city| 
                if key != "City"
                else 
                city
                return city  
              end   
              }      
        end 

        def find_state(address_items)
            address_items.each { |key, state| 
                if key != "AddressStateCode"
                else 
                state
                return state  
              end   
              }      
        end 

        # LATITUDE_LONGITUDE
        def find_latitude(result)
            result.each { |key, latitude| 
            if key != "RecAreaLatitude" 
            else 
               latitude
               return latitude
             end   
             }      
       end 

       def find_longitude(result)
        result.each { |key, longitude| 
        if key != "RecAreaLongitude" 
        else 
           longitude
           return longitude
         end   
         }      
   end 
   
#    URL

   def find_url(result)
            result.each { |key, value| 
            if key != "LINK" 
            else 
                link = value[0] 

              link.each { |link_key, url| 
                if link_key != "URL"
                else           
                    url 
                    return url   
                end  
            }
            end 
        } 
    end 


                
            

               # LINK, then
            # URL


        # ACTIVITIES
        def find_activities(result)
            activity_array = []
            result.each { |key, value| 
            if key != "ACTIVITY" 
            else 
               value.each {|activity| 
               activity.each {|activity_keys, attributes| 
               if activity_keys != "ActivityName"
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

        # PICTURES

        def find_pictures(result)
          picture_array = []
            result.each { |key, value| 
                if key != "MEDIA"
                else 
                    value.each {|picture|  
                    picture.each {|picture_keys, attributes| 
                    if picture_keys != "URL"
                    else 
                    picture_array << attributes
                  end          
                 }       
                    }
                     
                 end
            }  
             
             return picture_array
             end    
end
