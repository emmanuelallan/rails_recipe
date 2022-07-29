class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[destroy]

  # GET /recipes/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where.not(id: @recipe.foods.pluck(:id))
    @recipe_food = RecipeFood.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Ingredient was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Ingredient was successfully removed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
