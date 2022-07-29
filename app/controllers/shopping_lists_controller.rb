class ShoppingListsController < ApplicationController
  # GET /recipes or /recipes.json
  def index
    # @recipes = Recipe.where(public: true).order(created_at: :desc).includes(:user)
    @recipe_food = current_user.recipe_foods.includes(:food).order(created_at: :desc)
  end
end
