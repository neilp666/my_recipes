require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "bob", email: "bob@example.com",
                         password: "password", password_confirmation: "password")
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
  end

  test "recipe wthout chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test 'none should be present' do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

   test 'description should be present' do
    assert @recipe.valid?
  end

  test "description shouldn't be more than 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end

   test "description shouldn't be more than 500 characters" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
end

