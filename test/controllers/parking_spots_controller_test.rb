require "test_helper"

class ParkingSpotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_spot = parking_spots(:one)
  end

  test "should get index" do
    get parking_spots_url
    assert_response :success
  end

  test "should show parking_spot" do
    get parking_spot_url(@parking_spot)
    assert_response :success
  end

end
