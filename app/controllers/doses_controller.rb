class DosesController < ApplicationController

  # 1. A user can add a new dose (ingredient/description pair)
  # to an existing cocktail
  # GET "cocktails/42/doses/new"
  # POST "cocktails/42/doses"
  # --> new
  # --> create
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
    @doses = Dose.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # 2. A user can delete a dose that belongs to an existing cocktail.
  # DELETE "doses/25"
  # --> destroy
  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktails_path
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
