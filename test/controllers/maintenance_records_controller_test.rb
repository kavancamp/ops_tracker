require "test_helper"

class MaintenanceRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = Location.create!(name: "Test Location", region: "Wisconsin")

    @asset = Asset.create!(
      name: "Test Asset",
      asset_type: "Generator",
      serial_number: "TEST-001",
      status: "active",
      location: @location
    )
  end

  test "should get new" do
    get new_asset_maintenance_record_url(@asset)
    assert_response :success
  end
end
