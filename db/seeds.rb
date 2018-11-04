# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Clasification.delete_all

Clasification.create(value: 1, name: "Primer tercio", start_date: Date.today, finish_date: Date.today + 5, description: "", status: :active)
Clasification.create(value: 2, name: "Segundo tercio", start_date: Date.today, finish_date: Date.today + 5, description: "", status: :active)
Clasification.create(value: 3, name: "Tercio tercio", start_date: Date.today, finish_date: Date.today + 5, description: "", status: :active)
Clasification.create(value: 4, name: "Cachimbos", start_date: Date.today, finish_date: Date.today + 5, description: "", status: :active)

Group.delete_all

Group.create(name: "A", description: "", status: :active)
Group.create(name: "B", description: "", status: :active)
Group.create(name: "C", description: "", status: :active)
Group.create(name: "D", description: "", status: :active)
Group.create(name: "E", description: "", status: :active)
