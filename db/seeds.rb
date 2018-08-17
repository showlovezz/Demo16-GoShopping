# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category

Category.destroy_all

category_list = [
	{ name: "保養‧彩妝‧醫美" },
	{ name: "日用‧洗髮‧沐浴" },
	{ name: "服飾‧機能服‧鞋襪" },
	{ name: "美食‧飲品‧食材" },
	{ name: "3C‧家電" },
]

category_list.each do |category|
	Category.create( name: category[:name])
end

puts "Category created!"

# Default admin

User.create(email: "vitata710@gmail.com", password: "ssbb844135", role: "admin")
puts "Default admin created!"