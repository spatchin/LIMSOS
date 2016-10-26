require 'test_helper'

class FeedstocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedstock = feedstocks(:one)
  end

  test "should get index" do
    get feedstocks_url
    assert_response :success
  end

  test "should get new" do
    get new_feedstock_url
    assert_response :success
  end

  test "should create feedstock" do
    assert_difference('Feedstock.count') do
      post feedstocks_url, params: { feedstock: { amount: @feedstock.amount, biomass_type_id: @feedstock.biomass_type_id, harvest_id: @feedstock.harvest_id, unit: @feedstock.unit } }
    end

    assert_redirected_to feedstock_url(Feedstock.last)
  end

  test "should show feedstock" do
    get feedstock_url(@feedstock)
    assert_response :success
  end

  test "should get edit" do
    get edit_feedstock_url(@feedstock)
    assert_response :success
  end

  test "should update feedstock" do
    patch feedstock_url(@feedstock), params: { feedstock: { amount: @feedstock.amount, biomass_type_id: @feedstock.biomass_type_id, harvest_id: @feedstock.harvest_id, unit: @feedstock.unit } }
    assert_redirected_to feedstock_url(@feedstock)
  end

  test "should destroy feedstock" do
    assert_difference('Feedstock.count', -1) do
      delete feedstock_url(@feedstock)
    end

    assert_redirected_to feedstocks_url
  end
end
