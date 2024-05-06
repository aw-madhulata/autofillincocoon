require "application_system_test_case"

class VoyagesTest < ApplicationSystemTestCase
  setup do
    @voyage = voyages(:one)
  end

  test "visiting the index" do
    visit voyages_url
    assert_selector "h1", text: "Voyages"
  end

  test "should create voyage" do
    visit voyages_url
    click_on "New voyage"

    fill_in "Name", with: @voyage.name
    click_on "Create Voyage"

    assert_text "Voyage was successfully created"
    click_on "Back"
  end

  test "should update Voyage" do
    visit voyage_url(@voyage)
    click_on "Edit this voyage", match: :first

    fill_in "Name", with: @voyage.name
    click_on "Update Voyage"

    assert_text "Voyage was successfully updated"
    click_on "Back"
  end

  test "should destroy Voyage" do
    visit voyage_url(@voyage)
    click_on "Destroy this voyage", match: :first

    assert_text "Voyage was successfully destroyed"
  end
end
