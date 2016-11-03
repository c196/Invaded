require 'test_helper'

class ExploreControllerTest < ActionController::TestCase
  test "should get map" do
    get :map
    assert_response :success
  end

end
