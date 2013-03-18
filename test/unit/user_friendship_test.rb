require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:user)

  should belong_to (:friend)

  test "creating a friendship works" do
  	assert_nothing_raised do
  	UserFriendship.create user: users(:christos), friend: users(:mike)
  end
  end


end
