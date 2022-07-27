require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'Selma', email: 'selma@gmail.com', password: '1234567')
    @recipe = Recipe.new(
      name: 'test recipe',
      description: 'test description',
      preparation_time: '10',
      cooking_time: '1',
      public: true,
      user: @user
    )
  end

  it 'is valid with valid attributes' do
    expect(@recipe).to be_valid
  end

  it 'is not valid without a name' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not valid without a preparation time' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not valid without a cooking time' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not valid without a public' do
    @recipe.public = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not valid without a user' do
    @recipe.user = nil
    expect(@recipe).to_not be_valid
  end

  it 'is a valid description' do
    @recipe.description = 'short description'
    expect(@recipe).to be_valid
  end
end
