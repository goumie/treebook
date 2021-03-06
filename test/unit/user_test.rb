require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should have_many(:user_friendships)
  should have_many(:friends)



  test "a user should enter a first name" do
  	user=User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end
 test "a user should enter a last name" do
  	user=User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end
 test "a user should enter a profile name" do
  	user=User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

 test "a user should have a unique profile name" do
  	user=User.new
  	user.profile_name="goumie"
  	user.first_name="Christos"
  	user.last_name="Goumenos"
  	user.password="password"
  	user.password_confirmation="password"
  	user.email="goumenos.c@gmail.com"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
	  user = User.new(first_name: 'Christos', last_name: 'Goumenos', email: 'goumenos.c@gmail.com')
    user.password = user.password_confirmation = 'asdfasdf'

	  user.profile_name = "My profile with spaces"

	  assert !user.save
	  assert !user.errors[:profile_name].empty?
	  assert user.errors[:profile_name].include?("Must be formatted correctly.") 
   end

test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'Christos', last_name: 'Goumenos', email: 'goumenos.c2@gmail.com')
    user.password = user.password_confirmation = 'asdfasdf'
    user.profile_name = 'goumie_10'
    assert user.valid?

end

test "no error raised when trying to get friend list" do
  assert_nothing_raised do
    users(:christos).friends
  end
end

test "creating friendships on a user works" do
  users(:christos).friends << users(:bob)
  users(:christos).friends.reload
  assert users(:christos).friends.include?(users(:bob))
end

test "creating a friendship based on a user id and friend id works" do
  UserFriendship.create user_id: users(:christos).id, friend_id: users(:bob).id
  assert users(:christos).friends.include?(users(:bob))

end




end
