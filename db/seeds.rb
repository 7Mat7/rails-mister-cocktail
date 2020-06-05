require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = open(url).read
data = JSON.parse(response)
ingredients = data["drinks"]

ingredients.each do |item|
  Ingredient.create(name: item["strIngredient1"])
end

daiquiri = Cocktail.create(name: "Daiquiri")
teksun = Cocktail.create(name: "Tequila Sunrise")
bloomar = Cocktail.create(name: "Bloody Mary")

cocktail_list = [daiquiri, teksun, bloomar]

ingredients = Ingredient.all
cocktail_list.each do |c|
  3.times do
    desc = "#{rand(0..4)}cL"
    cockid = c.id
    ingr = ingredients.sample.id
    Dose.create(description: desc, cocktail_id: cockid, ingredient_id: ingr)
  end
end
