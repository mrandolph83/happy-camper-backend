
class Api::V1::RecAreasController < ApplicationController
  require 'rest-client'  
  before_action :set_rec_area, only: [:show, :update, :destroy]

  def rec_area_search
   
   
    keywords = params[:keywords]
    state_code = params[:stateCode1]
    activity = params[:activity1]


    search_call = RestClient.get("https://ridb.recreation.gov/api/v1/recareas?query=#{keywords}&limit=50&offset=0&full=true&state=#{state_code}&activity=#{activity}", headers={accept: 'application/json',
    apikey: 'c7e1bfea-aea3-436f-a007-619276d7bc13'})



    search_call_json = JSON.parse(search_call)
   
    render json: search_call
end

  # GET /rec_areas/1
  def show
    render json: @rec_area
  end

  # POST /rec_areas
  def create
    @rec_area = RecArea.new(rec_area_params)

    if @rec_area.save
      render json: @rec_area, status: :created, location: @rec_area
    else
      render json: @rec_area.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /rec_areas/1
  # def update
  #   if @rec_area.update(rec_area_params)
  #     render json: @rec_area
  #   else
  #     render json: @rec_area.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /rec_areas/1
  # def destroy
  #   @rec_area.destroy
  # end

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
