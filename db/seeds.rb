# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Delete News"
Nouvelle.destroy_all
p "Delete Users"
User.destroy_all
p "Launching Seeds"
user=User.create!(
  email: 'leduc.vicente@free.fr',
  password: 'jeangab11'
)

Nouvelle.create!(
  content: 'Saison 2023-2024 : Les cours ont lieu aux dojos : Le lundi soir de 19h30 à 21h30 Au Gymnase Pierre de Coubertin, 4 Rue Jacques Anquetil, 11400 Castelnaudary.
            Le jeudi soir de 20h00 à 22h00 au Complexe Sportif Le Millénaire, Rue Anatole France, 11400 Castelnaudary.',
  user: user
)

Nouvelle.create!(
  content: "Les cours de Ki-Aïkido ont lieu au Complexe Sportif Le Millénaire ainsi qu'au Gymnase de Coubertin à Castelnaudary.
            Si vous êtes intéressez, les deux premiers cours sont gratuits.",
  user: user
)
p "Seeds created"
