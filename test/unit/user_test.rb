require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end
  
  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end
  
  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  
  test "a users should have a unique profile name" do
    user = User.new
    user.profile_name = users(:jason).profile_name
    assert !user.save
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user should have a profile name without spces" do
    user = User.new
    user.profile_name = "Profile with space"
    
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
  
  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'jason', last_name: 'za', email: 'jaz@freieze.net')
    user.password = user.password_confirmation = '1121234abc'
    user.profile_name = 'jabbbooya'
    assert user.valid?
  end
end
