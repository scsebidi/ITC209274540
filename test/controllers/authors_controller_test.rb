require 'test_helper'

class AuthorControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get show" do
  	get :show, id: authors(:jason).author_name
  	assert_response :success
  	assert_template "authors/show"
  end
end
