class PublicRecipesController < ApplicationController
  before_action :set_public_recipe, only: %i[show]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all.where(public: true)
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_public_recipe
    @recipe = Recipe.find(params[:id])
  end
end
