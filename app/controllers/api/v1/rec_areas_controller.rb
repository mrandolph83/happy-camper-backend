
class Api::V1::RecAreasController < ApplicationController
  require 'rest-client'  
  before_action :set_rec_area, only: [:show, :update, :destroy]

  def rec_area_search
   
    
    keywords = params[:keywords]
    state_code = params[:stateCode1]
    activity = params[:activity1]


    search_call = RestClient.get("https://ridb.recreation.gov/api/v1/recareas?offset=0&full=true&state=#{state_code}", headers={accept: 'application/json',
   
    apikey: ENV["KEY"]})
    
    # Add a Find or Create Method here

    search_call_json = JSON.parse(search_call)
    # Down to the values 
    results_array = search_call_json.values[0]
   
    returned_results = get_results(results_array)

    rec_area_json = RecAreaSerializer.new(returned_results).serializable_hash.to_json
    render json: rec_area_json
end

  # GET /rec_areas/1
  def show
    render json: @rec_area
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rec_area
      @rec_area = RecArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rec_area_params
      params.require(:rec_area).permit(:name, :description, :street_address, :city, :state, :zip_code, :images)
    end
end
