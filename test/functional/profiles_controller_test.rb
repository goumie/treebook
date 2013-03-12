require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:christos).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end


  test "should render a 404 not found" do
    get :show, id: "PPPPPOOOOPPPP"
    assert_response :not_found
  
  end

test "variables are assigned when profile is viewed" do
	get :show, id: users(:christos).profile_name
	assert assigns(:user)
	assert_not_empty assigns(:statuses)
end

test "only shows content of correct user" do
	get :show, id: users(:christos).profile_name
	assigns(:statuses).each do |status|
		assert_equal users(:christos), status.user
	end
end

end
