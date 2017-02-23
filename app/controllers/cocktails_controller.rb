class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    # to create a cocktail. you should be able to specify:
    #   the name of the cocktail
    #   the name of the ingredient -> another kind of object
    #   The dose for each ingredient
    @cocktail = Cocktail.new

    @ingredient = Ingredient.new
  end

  def edit
  end

  def create

    # check if the ingredients are ok.
    # start to create different doses for each ingredient
    # create the cockatil with all the doses - ingredients appended
    @cocktail = Cocktail.new(cocktail_params)


      if @cocktail.save
        redirect_to @cocktail, notice: 'Cocktail was successfully created.'
      else
       render :new
      end
  end

  def update
   if @cocktail.update(cocktail_params)
     redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
    else
      render :edit
    end
 end

  def destroy
    @cocktail.destroy
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail was successfully destroyed.'
  end

  private

    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end


    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
end
