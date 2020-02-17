require 'test_helper'

class NaturalPeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get natural_people_index_url
    assert_response :success
  end

  test "should get new" do
    get natural_people_new_url
    assert_response :success
  end

  test "should get edit" do
    get natural_people_edit_url
    assert_response :success
  end

  test "should get update" do
    get natural_people_update_url
    assert_response :success
  end

  test "should get create" do
    get natural_people_create_url
    assert_response :success
  end

end
