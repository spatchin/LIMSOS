require 'test_helper'

class HarvestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @harvest = harvests(:one)
  end

  test "should get index" do
    get harvests_url
    assert_response :success
  end

  test "should get new" do
    get new_harvest_url
    assert_response :success
  end

  test "should create harvest" do
    assert_difference('Harvest.count') do
      post harvests_url, params: { harvest: { biomass_id: @harvest.biomass_id, fertilizer_applications: @harvest.fertilizer_applications, fertilizer_types: @harvest.fertilizer_types, harvest_date: @harvest.harvest_date, planting_date: @harvest.planting_date, plot_information: @harvest.plot_information, plot_location: @harvest.plot_location, soil_information: @harvest.soil_information, storage_location: @harvest.storage_location, weather_information: @harvest.weather_information } }
    end

    assert_redirected_to harvest_url(Harvest.last)
  end

  test "should show harvest" do
    get harvest_url(@harvest)
    assert_response :success
  end

  test "should get edit" do
    get edit_harvest_url(@harvest)
    assert_response :success
  end

  test "should update harvest" do
    patch harvest_url(@harvest), params: { harvest: { biomass_id: @harvest.biomass_id, fertilizer_applications: @harvest.fertilizer_applications, fertilizer_types: @harvest.fertilizer_types, harvest_date: @harvest.harvest_date, planting_date: @harvest.planting_date, plot_information: @harvest.plot_information, plot_location: @harvest.plot_location, soil_information: @harvest.soil_information, storage_location: @harvest.storage_location, weather_information: @harvest.weather_information } }
    assert_redirected_to harvest_url(@harvest)
  end

  test "should destroy harvest" do
    assert_difference('Harvest.count', -1) do
      delete harvest_url(@harvest)
    end

    assert_redirected_to harvests_url
  end
end
