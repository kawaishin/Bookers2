require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get books_home_url
    assert_response :success
  end

  test "should get log_in" do
    get books_log_in_url
    assert_response :success
  end

  test "should get sign_up" do
    get books_sign_up_url
    assert_response :success
  end

  test "should get about" do
    get books_about_url
    assert_response :success
  end

end
