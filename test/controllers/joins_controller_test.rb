require 'test_helper'

class JoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get _join" do
    get joins__join_url
    assert_response :success
  end

  test "should get create" do
    get joins_create_url
    assert_response :success
  end

  test "should get destroy" do
    get joins_destroy_url
    assert_response :success
  end

  test "should get show" do
    get joins_show_url
    assert_response :success
  end

end
