# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Memory.destroy_all

Memory.create(title: "Baby's first words", content: "Today the baby said her first word - Dada!")
Memory.create(title: "Giggle", content: "The baby laughed for the first time today at a funny face")
Memory.create(title: "Hiccup", content: "The baby did their first hiccup today")