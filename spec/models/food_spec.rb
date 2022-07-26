require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: "John Doe")
    @food = Food.new(
      name: "MyString",
      measurement_unit: "grams",
      price: "9.99",
      quantity: "9.99",
      user: @user
    )
  end

  it 'is valid with valid attributes' do
    expect(@food).to be_valid
  end

  it 'is not valid without a name' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'is not valid without a measurement_unit' do
    @food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

  it 'is not valid without a price' do
    @food.price = nil
    expect(@food).to_not be_valid
  end

  it 'is not valid without a quantity' do
    @food.quantity = nil
    expect(@food).to_not be_valid
  end

  it 'is not valid without a user' do
    @food.user = nil
    expect(@food).to_not be_valid
  end

  it 'is a valid measurement_unit' do
    @food.measurement_unit = "grams"
    expect(@food).to be_valid

    @food.measurement_unit = 23
    expect(@food).to_not be_valid
  end
end
