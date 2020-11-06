require 'test_helper'

class FurimaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get furima_index_url
    assert_response :success
  end

end
