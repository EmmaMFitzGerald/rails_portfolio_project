# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Memory.destroy_all

User.destroy_all

Child.destroy_all


user_1 = User.create(email: "emma@gmail.com", name: 'Emma', password:"123456")
user_2 = User.create(email: "erica@gmail.com", name: 'Erica', password:"123456")
user_3 = User.create(email: "zoe@gmail.com", name: 'Zoe', password:"123456")
user_4 = User.create(email: "kristin@gmail.com", name: 'Kristin', password:"123456")

child_1 = Child.create(name: 'Emma', birthday: '1993-6-6', user_id: user_1.id)
child_2 = Child.create(name: 'Holly', birthday: '1995-6-1', user_id: user_2.id)
child_3 = Child.create(name: 'Sophie', birthday: '1996-5-10', user_id: user_3.id)
child_4 = Child.create(name: 'Sarah', birthday: '1999-10-12', user_id: user_4.id)

cat_1 = Category.create(name: 'Milestone')
cat_2 = Category.create(name: 'Funny memory')
cat_3 = Category.create(name: 'Accomplishment')
cat_4 = Category.create(name: 'Story')

Memory.create(title: "Baby's first words", content: "Today the baby said her first word - Dada!", child_id: child_1.id, user: user_1, category_id: cat_1.id)
Memory.create(title: "Giggle", content: "The baby laughed for the first time today at a funny face", child_id: child_2.id, user_id: user_2.id, category_id: cat_2.id)
Memory.create(title: "Hiccup", content: "The baby did their first hiccup today", child_id: child_3.id, user_id: user_3.id, category_id: cat_3.id)
Memory.create(title: "First Day at School", content: "Sarah started school today", child_id: child_4.id, user_id: user_4.id, category_id: cat_4.id)
