class ApplicationController < ActionController::API
 include ::ActionController::Cookies  
        def current_user      
            User.find_by(session[:user_id]) 
        end 

        def logged_in?
            !!current_user 
        end

        def get_results(results_array)
          results_array.map {|result| parse_results(result)}         
       end
     
# CUSTOM DATA PARSER THROUGH RIDB API. ALL RE?SULTS CURRENTLY LOADED INTO LOCAL SERVER AS RECAREA OBJECTS

#        def parse_results(result)
#            id = find_id(result)
#            name = find_name(result)
#            description = find_description(result)
#            address = find_address(result)
#            state = find_state(address)
#            latitude = find_latitude(result)
#            longitude = find_longitude(result)
#           #  url = find_url(result)
           
#            activities = find_activities(result)
          
#            images = find_images(result) 
#            find_or_create_rec_area(id, name, description, state, latitude, longitude, activities, images)
#        end

#        def find_or_create_rec_area(id, name, description, state, latitude, longitude, activities, images)
            
#         if RecArea.exists?(id)
#             rec_area = RecArea.find_by(id)
#           else
#             rec_area = RecArea.new
#             rec_area.id = id.to_i
#             rec_area.name = name
#             rec_area.description = description 
#             rec_area.state = state
#             rec_area.latitude = latitude
#             rec_area.longitude = longitude
#             rec_area.activities = activities 
#             rec_area.images = images 
#             rec_area.save!
#          end
#          rec_area
#     end
       

#        def find_id(result)
          
#            result.each { |key, value| 
#              if key != "RecAreaID"
#              else
#                id = value 
#                return id  
#              end   
#              }      
#        end

#        def find_name(result)
#            result.each { |key, value| 
#                if key != "RecAreaName"
#                else 
#                name = value 
#                return name  
#              end   
#              }      
#        end

#        def find_description(result)
#            result.each { |key, value| 
#                if key != "RecAreaDescription"
#                else 
#                description = value
#                return description  
#              end   
#              }      
#        end

#    #  ADDRESS 
#    def find_address(result)
#     result.fetch("RECAREAADDRESS", " ")[0]
#     end


#       def find_state(address)
#         hash_fix = address.to_h
#         hash_fix.fetch("AddressStateCode", " ")
          
#       end 

#        # LATITUDE_LONGITUDE
#        def find_latitude(result)
#            result.each { |key, latitude| 
#            if key != "RecAreaLatitude" 
#            else 
#               latitude
#               return latitude
#             end   
#             }      
#       end 

#       def find_longitude(result)
#        result.each { |key, longitude| 
#        if key != "RecAreaLongitude" 
#        else 
#           longitude
#           return longitude
#         end   
#         }      
#   end 
  
# #    URL



 

#        # ACTIVITIES
#        def find_activities(result)
#            activity_array = []
#            result.each { |key, value| 
#            if key != "ACTIVITY" 
#            else 
#               value.each {|activity| 
#               activity.each {|activity_keys, attributes| 
#               if activity_keys != "ActivityName"
#               else 
#               activity_array << attributes
#             end          
#            }       
#               }        
#            end
#       }  
#        activities = activity_array.join(', ')
#        return activities
#        end

#        # images

#        def find_images(result)   
#          picture_array = []
#            result.each { |key, value| 
#                if key != "MEDIA"
#                else 
#                    value.each {|picture|  
#                    picture.each {|picture_keys, attributes| 
#                    if picture_keys != "URL"
#                    else 
                      
#                    picture_array << attributes
#                  end          
#                 }       
#                    }      
#                 end
#            }  
            
#           picture_array.sample
          
#             end
            
           
      def search_rec_areas(keywords, state_code, activity)
        if keywords != ""
          keyword_parse = RecArea.where("name LIKE ?", "%" + keywords + "%").to_a
          keyword_parse
        else
        activity_parse = RecArea.where("activities LIKE ?", "%" + activity + "%").to_a
        state_parse = state_selection(activity_parse, state_code)
        state_parse
        end
      end

      def state_selection(activity_parse, state_code)
        state_parse_array = []
        activity_parse.each{|rec_area| 
        if rec_area.state == state_code
          state_parse_array << rec_area
        end
        }
        state_parse_array
      
    end 

          
end