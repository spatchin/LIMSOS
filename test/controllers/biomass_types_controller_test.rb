require 'test_helper'

class BiomassTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @biomass_type = biomass_types(:one)
  end

  test "should get index" do
    get biomass_types_url
    assert_response :success
  end

  test "should get new" do
    get new_biomass_type_url
    assert_response :success
  end

  test "should create biomass_type" do
    assert_difference('BiomassType.count') do
      post biomass_types_url, params: { biomass_type: {  } }
    end

    assert_redirected_to biomass_type_url(BiomassType.last)
  end

  test "should show biomass_type" do
    get biomass_type_url(@biomass_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_biomass_type_url(@biomass_type)
    assert_response :success
  end

  test "should update biomass_type" do
    patch biomass_type_url(@biomass_type), params: { biomass_type: {  } }
    assert_redirected_to biomass_type_url(@biomass_type)
  end

  test "should destroy biomass_type" do
    assert_difference('BiomassType.count', -1) do
      delete biomass_type_url(@biomass_type)
    end

    assert_redirected_to biomass_types_url
  end
end
