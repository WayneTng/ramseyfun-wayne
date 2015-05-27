# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fan.destroy_all
Dish.destroy_all

fan = Fan.new(name: 'wayne', email: 'wayne@futureworkz.com', password: 12345678)
fan.skip_confirmation!
fan.save!

Dish.create!(title: 'Chicken Rice',
             description: 'Receipe: 1 Whole chicken, salt, pepper, galic, pandan leave.',
             cost: 20,
             pax: 3,
             published: true,
             vegetarian: false,
             fan_id: Fan.first.id)

Dish.create!(title: 'Curry Chicken',
             description: 'Receipe: Chicken wing, curry paste, salt, pepper, galic, pandan leave.',
             cost: 50,
             pax: 5,
             published: true,
             vegetarian: false,
             fan_id: Fan.first.id)
