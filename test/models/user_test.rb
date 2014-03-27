require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'creating user with valid data' do
    assert_difference('User.count', +1) do
      user = FactoryGirl.create(:user)  
      assert user.valid?
    end
  end
  
  test 'email cant be blank' do
     user = FactoryGirl.create(:user)
     user.email = ''
     assert !user.valid?   
  end

  test 'email must be formatted' do
    user = FactoryGirl.create(:user)
    user.email = 'itsnotvalidemail'
    assert !user.valid?
  end

  test 'email must be unique' do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.build(:user)
    assert !user1.valid?
  end

  test 'deleting user' do
    user = FactoryGirl.create(:user)
    assert_difference('User.count', -1) do
      user.delete
    end
  end

  test 'full name returns full name' do
    user = FactoryGirl.create(:user)
    assert_equal 'Jan Kowalski', user.full_name
  end

  test 'full name when first_name is blank' do
    user = FactoryGirl.create(:user)
    user.first_name = ''
    assert_equal 'Kowalski', user.full_name
  end

  test 'full name when last_name is blank' do
    user = FactoryGirl.create(:user)
    user.last_name = ''
    assert_equal 'Jan', user.full_name
  end

  test 'full name when first_name and last_name are blank' do
    user = FactoryGirl.create(:user)
    user.first_name = ''
    user.last_name = ''
    assert_equal 'Użytkownik', user.full_name
  end
end
