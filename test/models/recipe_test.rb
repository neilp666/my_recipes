require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = Recipe.new(name: "vegetable", description: "geat vegetable recipe")
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

