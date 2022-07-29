require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.new(name: 'Selma', email: 'selma@gmail.com', password: '1234567')
    @food = Food.new(
      name: 'MyString',
      measurement_unit: 'grams',
      price: 9,
      user: @user
    )
    @recipe = Recipe.new(
      name: 'test recipe',
      description: 'test description',
      preparation_time: '10',
      cooking_time: '1',
      public: true,
      user: @user
    )
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: 10)
  end

  it 'is valid with valid attributes' do
    expect(@recipe_food).to be_valid
  end

  it 'is not valid without a recipe' do
    @recipe_food.recipe = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'is not valid without a food' do
    @recipe_food.food = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'is not valid without a quantity' do
    @recipe_food.quantity = nil
    expect(@recipe_food).to_not be_valid
  end
end
