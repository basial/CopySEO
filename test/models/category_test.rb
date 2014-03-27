require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'creating category with valid data' do
    assert_difference('Category.count', +1) do
      category = FactoryGirl.create(:category)  
    end
  end
  
  test 'title cant be blank' do
     category = FactoryGirl.create(:category)
     category.title = ''
     assert !category.valid?   
  end

  test 'deleting category' do
    category = FactoryGirl.create(:category)
    assert_difference('Category.count', -1) do
      category.delete
    end
  end

  test 'new category doesnt have last contributor' do
    category = FactoryGirl.create(:category)
    assert_equal false, category.last_contributor
  end

  test 'new category has no previous versions' do
    category = FactoryGirl.create(:category)
    assert_equal 1, category.versions.count
  end
end
