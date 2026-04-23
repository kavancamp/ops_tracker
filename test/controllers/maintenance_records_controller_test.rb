require "test_helper"

class MaintenanceRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get maintenance_records_new_url
    assert_response :success
  end

  test "should get create" do
    get maintenance_records_create_url
    assert_response :success
  end
end
