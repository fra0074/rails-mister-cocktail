class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
        redirect_to ingredients_path, notice: 'Ingredient was successfully created.'
    else
       render :new
      end
    end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
         redirect_to ingredients_path, notice: 'Ingredient was successfully updated.'
    else
        render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to ingredients_path, notice: 'Ingredient was successfully destroyed.'
  end

  private

  def ingredient_params
      params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
