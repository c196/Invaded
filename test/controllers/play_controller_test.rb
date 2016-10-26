require 'test_helper'

class PlayControllerTest < ActionController::TestCase
  test "should get hub" do
    get :hub
    assert_response :success
  end

end
