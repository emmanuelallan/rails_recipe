class FoodsRecipesController < ApplicationController
  before_action :set_foods_recipes, only: %i[destroy]

  # GET /ingerients/new
  def new
    @foods  = Food.all
    @foods_recipe = FoodsRecipe.new
    @recipe_id = params[:recipe_id]
  end

  # POST /recipes or /recipes.json
  def create
    @foods  = Food.all
    @foods_recipe = FoodsRecipe.new(foods_recipes_params)

    respond_to do |format|
      if @foods_recipe.save
        format.html { redirect_to recipe_path(@foods_recipe.recipe_id), notice: 'foods_recipe was successfully added to recipe.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @foods_recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(@foods_recipe.recipe_id), notice: 'foods_recipe was successfully removed from recipe.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_foods_recipes
    @foods_recipe = FoodsRecipe.find_by(food_id: params[:food_id], recipe_id: params[:recipe_id])
  end

  # Only allow a list of trusted parameters through.
  def foods_recipes_params
    params.require(:foods_recipe).permit(:food_id, :quantity, :recipe_id)
  end
end
