require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/recipes", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Recipe. As you add validations to Recipe, be sure to
  # adjust the attributes here as well.
  let(:user) { User.create!(name: 'Max', email:'max@gmail.com', password: '1234567') }
  let(:valid_attributes) do {
    name: 'test recipe',
    description: 'test description',
    preparation_time: '10',
    cooking_time: '1',
    public: true,
    user: user
    }
  end

  let(:invalid_attributes) do {
    name: nil,
    description: nil,
    preparation_time: nil,
    cooking_time: nil,
    public: nil,
    user: nil
  }
end

  describe "GET /index" do
    it "renders a successful response" do
      Recipe.create! valid_attributes
      get recipes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      recipe = Recipe.create! valid_attributes
      get recipe_url(recipe)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_recipe_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Recipe" do
        expect {
          post recipes_url, params: { recipe: valid_attributes }
        }.to change(Recipe, :count).by(1)
      end

      it "redirects to the created recipe" do
        post recipes_url, params: { recipe: valid_attributes }
        expect(response).to redirect_to(recipe_url(Recipe.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Recipe" do
        expect {
          post recipes_url, params: { recipe: invalid_attributes }
        }.to change(Recipe, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post recipes_url, params: { recipe: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested recipe" do
      recipe = Recipe.create! valid_attributes
      expect {
        delete recipe_url(recipe)
      }.to change(Recipe, :count).by(-1)
    end

    it "redirects to the recipes list" do
      recipe = Recipe.create! valid_attributes
      delete recipe_url(recipe)
      expect(response).to redirect_to(recipes_url)
    end
  end
end