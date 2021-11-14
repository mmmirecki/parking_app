require "application_system_test_case"

class ParkingSpotsTest < ApplicationSystemTestCase
  setup do
    @parking_spot = parking_spots(:one)
  end

  test "visiting the index" do
    visit parking_spots_url
    assert_selector "h1", text: "Parking Spots"
  end

  test "creating a Parking spot" do
    visit parking_spots_url
    click_on "New Parking Spot"

    click_on "Create Parking spot"

    assert_text "Parking spot was successfully created"
    click_on "Back"
  end

  test "updating a Parking spot" do
    visit parking_spots_url
    click_on "Edit", match: :first

    click_on "Update Parking spot"

    assert_text "Parking spot was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking spot" do
    visit parking_spots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking spot was successfully destroyed"
  end
end
