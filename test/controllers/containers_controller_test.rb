require "test_helper"

class ContainersControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get containers_search_url
    assert_response :success
  end
end
