require 'test_helper'

class LegalPeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get legal_people_index_url
    assert_response :success
  end

end
