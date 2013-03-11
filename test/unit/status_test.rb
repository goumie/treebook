require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a status requires conent" do 
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

test "status is at least two letters" do
	status = Status.new
	status.content = "H"
	assert !status.save
	assert !status.errors[:content].empty?

end

test "status has to have a user id" do
	status= Status.new
	status.content = "Hello"
	assert !status.save
	assert !status.errors[:user_id].empty?
end

end
