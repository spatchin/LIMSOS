require 'test_helper'

class BiomassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @biomass = biomasses(:one)
  end

  test "should get index" do
    get biomasses_url
    assert_response :success
  end

  test "should get new" do
    get new_biomass_url
    assert_response :success
  end

  test "should create biomass" do
    assert_difference('Biomass.count') do
      post biomasses_url, params: { biomass: {  } }
    end

    assert_redirected_to biomass_url(Biomass.last)
  end

  test "should show biomass" do
    get biomass_url(@biomass)
    assert_response :success
  end

  test "should get edit" do
    get edit_biomass_url(@biomass)
    assert_response :success
  end

  test "should update biomass" do
    patch biomass_url(@biomass), params: { biomass: {  } }
    assert_redirected_to biomass_url(@biomass)
  end

  test "should destroy biomass" do
    assert_difference('Biomass.count', -1) do
      delete biomass_url(@biomass)
    end

    assert_redirected_to biomasses_url
  end
end
