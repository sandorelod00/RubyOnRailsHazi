require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    equal? true
  end

  test "cannot save user without name" do
    u = User.new email: 'hello@hello.hello'
    assert !u.save, "Cannot save."
  end

  test "cannot save without email" do
    u = User.new name: 'Alma'
    assert !u.save, "Cannot save."
  end

  test "cannot save with existing email email" do
    u = User.new email: users(:admin).email
    assert !u.save, "Cannot save."
  end

  test "encrypted" do
    u = User.find users(:admin).id
    assert_equal u.encrypted_password, Digest::SHA1.hexdigest('adminadmin'), "Good"
  end

end
