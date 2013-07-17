require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a status requires content" do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
  end
  
  test "that satus is longer than 5 characters" do
    status = Status.new
    status.content = "happy"
    assert !status.save
    assert !status.errors[:content].empty?
  end
  
  test "that status has a user id" do
    status = Status.new
    status.content = "London"
    assert !status.save
    assert !status.errors[:user_id].empty?
  end
end
