class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    @doses = Dose.all
  end

  def show

  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def edit
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
        redirect_to @cocktail
    else
       render :new
    end
  end

  def update
    if @dose.update(dose_params)
     redirect_to @dose
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_url
  end

  private

    def set_dose
      @dose = Dose.find(params[:id])
    end


    def dose_params
      params.require(:dose).permit(:description,:ingredient_id)
    end

end
