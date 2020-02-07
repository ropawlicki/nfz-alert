require 'test_helper'

class QueryControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get query_create_url
    assert_response :success
  end

  test "should get destroy" do
    get query_destroy_url
    assert_response :success
  end

  test "should get fetch" do
    get query_fetch_url
    assert_response :success
  end

end
