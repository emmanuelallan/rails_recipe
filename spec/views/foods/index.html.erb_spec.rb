require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  before(:each) do
    assign(:foods, [
      Food.create!(
        name: "Name",
        measurement_unit: "9.99",
        price: "9.99",
        quantity: "9.99",
        user: nil
      ),
      Food.create!(
        name: "Name",
        measurement_unit: "9.99",
        price: "9.99",
        quantity: "9.99",
        user: nil
      )
    ])
  end

  it "renders a list of foods" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
