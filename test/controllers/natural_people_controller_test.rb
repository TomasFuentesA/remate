require 'test_helper'

class NaturalPeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get natural_people_index_url
    assert_response :success
  end

end
