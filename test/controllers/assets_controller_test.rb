require "test_helper"

class AssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = Location.create!(name: "Test Location", region: "Wisconsin")
  end

  test "should get index" do
    get assets_url
    assert_response :success
  end

  test "should get new" do
    get new_asset_url
    assert_response :success
  end
end
