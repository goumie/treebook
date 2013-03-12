require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
	test "/login route opens the login page" do
	get '/login'
	assert_response :success
		
	end

	test "/login route opens the logout page" do
	get '/logout'
	assert_response :redirect
	assert_redirected_to '/'
		
	end

	test "/login route opens the register page" do
	get '/register'
	assert_response :success
	
		
	end

	test "profile page workds" do
		get '/goumie'
		assert_response :success
	end


end
