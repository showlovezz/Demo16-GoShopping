namespace :dev do
	task fake: :environment do
		Product.destroy_all

		50.times do |i|
			Product.create!(
				name: FFaker::Product.product_name,
				product_price: FFaker::rand(1000..3000),
				description: FFaker::Lorem.paragraph,
				category_id: Category.all.sample.id
			)
		end

		puts "have created fake products"
		puts "now you have #{Product.count} products data"
	end
end