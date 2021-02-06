require 'test_helper'

class ClansControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clans_show_url
    assert_response :success
  end

end
