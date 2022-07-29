class PublicRecipesController < ApplicationController
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc).includes(:user)
  end
end
