require "test_helper"

class RecAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rec_area = rec_areas(:one)
  end

  test "should get index" do
    get rec_areas_url, as: :json
    assert_response :success
  end

  test "should create rec_area" do
    assert_difference('RecArea.count') do
      post rec_areas_url, params: { rec_area: { city: @rec_area.city, description: @rec_area.description, images: @rec_area.images, name: @rec_area.name, state: @rec_area.state, street_address: @rec_area.street_address, zip_code: @rec_area.zip_code } }, as: :json
    end

    assert_response 201
  end

  test "should show rec_area" do
    get rec_area_url(@rec_area), as: :json
    assert_response :success
  end

  test "should update rec_area" do
    patch rec_area_url(@rec_area), params: { rec_area: { city: @rec_area.city, description: @rec_area.description, images: @rec_area.images, name: @rec_area.name, state: @rec_area.state, street_address: @rec_area.street_address, zip_code: @rec_area.zip_code } }, as: :json
    assert_response 200
  end

  test "should destroy rec_area" do
    assert_difference('RecArea.count', -1) do
      delete rec_area_url(@rec_area), as: :json
    end

    assert_response 204
  end
end
