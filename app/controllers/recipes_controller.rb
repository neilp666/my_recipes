class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was updated succesfully"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_chef
    if @recipe.save
      flash[:success] = "Recipe was created succesfully"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def new
    @recipe = Recipe.new
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe deleted succesfully"
    redirect_to recipes_path
  end
  
  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
