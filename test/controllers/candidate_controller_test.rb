require 'test_helper'

class CandidateControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get candidate_new_url
    assert_response :success
  end

end
