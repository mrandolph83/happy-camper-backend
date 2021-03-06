
class Api::V1::RecAreasController < ApplicationController
  require 'rest-client'  
  before_action :set_rec_area, only: [:show, :update, :destroy]

#   def rec_area_search
#     keywords = params[:keywords]
#     state_code = params[:stateCode1]
#     activity = params[:activity1]
#     search_call = RestClient.get("https://ridb.recreation.gov/api/v1/recareas?=20&offset=0&full=true", headers={accept: 'application/json',
#     apikey: ENV["KEY"]})
#     search_call_json = JSON.parse(search_call)
#     results_array = search_call_json.values[0]
#     returned_results = get_results(results_array)
#     # rec_area_json = RecAreaSerializer.new(returned_results).serializable_hash.to_json
#     # render json: rec_area_json
# end

def rec_area_search
  
  keywords = params[:keywords] || ""
  state_code = params[:stateCode1] || ""
  activity = params[:activity1] || ""
  full_parse = search_rec_areas(keywords, state_code, activity)
  rec_area_json = RecAreaSerializer.new(full_parse).serializable_hash.to_json
  # rec_area_json = state_parse.serializable_hash

  render json: rec_area_json
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
