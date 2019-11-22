class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]
  # 1. can see list of cocktails: get 'cocktails'
  # --> index
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
    @dose = Dose.new

end
  # 2. can see the details of a given cocktail,
  # with the dose needed for each ingredient: get 'cocktails/42'
  # --> show

  def show
    @doses = Dose.all


    # if want to include form 'new dose' on the page show: include:
    # @dose = Dose.new
    # and insert the form in show page
  end

  # 3. can create a new coctail: get 'cocktails/new'; post 'cocktails'
  # --> new
  # --> create

  def new
    @cocktail = Cocktail.new
    @cocktail_dose = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
    @doses = Dose.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      # redirect_to cocktail_path(@cocktail)
      redirect_to cocktails_path
    else
      render :new
    end
    @cocktail_dose = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail_dose
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredients, :doses, :photo)
  end
end
