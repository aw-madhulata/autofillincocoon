require "test_helper"

class VoyagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voyage = voyages(:one)
  end

  test "should get index" do
    get voyages_url
    assert_response :success
  end

  test "should get new" do
    get new_voyage_url
    assert_response :success
  end

  test "should create voyage" do
    assert_difference("Voyage.count") do
      post voyages_url, params: { voyage: { name: @voyage.name } }
    end

    assert_redirected_to voyage_url(Voyage.last)
  end

  test "should show voyage" do
    get voyage_url(@voyage)
    assert_response :success
  end

  test "should get edit" do
    get edit_voyage_url(@voyage)
    assert_response :success
  end

  test "should update voyage" do
    patch voyage_url(@voyage), params: { voyage: { name: @voyage.name } }
    assert_redirected_to voyage_url(@voyage)
  end

  test "should destroy voyage" do
    assert_difference("Voyage.count", -1) do
      delete voyage_url(@voyage)
    end

    assert_redirected_to voyages_url
  end
end
