require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path #this path is automatically generated when we put the get operation in the routes
    assert_response :success
  end

end
