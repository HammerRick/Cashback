require 'test_helper'

class UserTest < ActiveSupport::TestCase
  VALID_USER_HASH = {
    email: 'user_email@mailer.com',
    username: 'user',
    password: 'secret'
  }.freeze

  test 'create valid user' do
    user = User.create(VALID_USER_HASH)
    assert user.valid? == true
  end

  test 'create invalid user with BLANK username' do
    blank_username = VALID_USER_HASH.merge({username: ''})
    user = User.create(blank_username)

    expected_error = {
      username: ["can't be blank"]
    }

    assert user.valid? == false
    assert user.errors.messages == expected_error
  end

  test 'create invalid user with nil username' do
    nil_username = VALID_USER_HASH.merge({username: nil})
    user = User.create(nil_username)

    expected_error = {
      username: ["can't be blank"]
    }

    assert user.valid? == false
    assert user.errors.messages == expected_error
  end

  test 'create invalid user with non unique username' do
    User.create(VALID_USER_HASH)
    repeated_username = VALID_USER_HASH.merge({email: 'not_the_same@mailer.com'})
    bad_user = User.create(repeated_username)

    expected_error = {
      username: ['has already been taken']
    }

    assert bad_user.valid? == false
    assert bad_user.errors.messages == expected_error
  end

  test 'create invalid user with BLANK email' do
    blank_email = VALID_USER_HASH.merge({email: ''})
    user = User.create(blank_email)

    expected_error = {
      email: ["can't be blank"]
    }

    assert user.valid? == false
    assert user.errors.messages == expected_error
  end

  test 'create invalid user with nil email' do
    nil_email = VALID_USER_HASH.merge({email: nil})
    user = User.create(nil_email)

    expected_error = {
      email: ["can't be blank"]
    }

    assert user.valid? == false
    assert user.errors.messages == expected_error
  end

  test 'create invalid user with non unique email' do
    User.create(VALID_USER_HASH)
    repeated_email = VALID_USER_HASH.merge({username: 'new_username'})
    bad_user = User.create(repeated_email)

    expected_error = {
      email: ['has already been taken']
    }

    assert bad_user.valid? == false
    assert bad_user.errors.messages == expected_error
  end
end
