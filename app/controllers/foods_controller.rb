class FoodsController < ApplicationController
  before_action :set_food, only: %i[ destroy ]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    new_food_param = food_params.merge(user_id: current_user.id)
    @food = Food.new(new_food_param)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url(@food), notice: "Food was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
    end
end
