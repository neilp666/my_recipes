require 'test_helper'

class ChefsSignupTest < ActionDispatch::IntegrationTest
  test "Should get Signup Path" do
    get signup_path
    assert_response :success
  end
end
