require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase



  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | " + APP_NAME
  end


  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | " + APP_NAME
  end


end

