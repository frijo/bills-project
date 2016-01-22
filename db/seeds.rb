# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(nick_name:"wolfhot",first_name: "David", last_name: "Arroyo", email: "frijo45@gmail.com", password: "passAdmin",admin: true,profile_photo:"http://usercontent2.hubimg.com/9137907.png")
u2 = User.create(nick_name:"wolfhot2",first_name: "Davida", last_name: "Arroyoa", email: "frijo46@gmail.com", password: "passAdmin",admin: true,profile_photo:"http://usercontent2.hubimg.com/9137907.png")
fc1= FoodCategory.create(category:"meal")
fc2= FoodCategory.create(category:"drinks")
f1=Food.create(code_food: "cod-tila",food_name:"Tilapia",cost_price: 2500,sale_price: 4500,food_categories_id:1)
f2=Food.create(code_food: "cod-Gas",food_name:"Pepsi",cost_price: 500,sale_price: 1000,food_categories_id:10)

