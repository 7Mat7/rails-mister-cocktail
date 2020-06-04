class DosesController < ApplicationController

  @ingredients = []
  liste = Ingredient.all
  puts "=============================================================="
  liste.each do |ingredient|
    @ingredients << ingredient.name

  end
    puts @ingredients
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
  params.require(:dose).permit(:description, :ingredient_id)
  end
end
