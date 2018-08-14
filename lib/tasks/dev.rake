namespace :dev do
	task fake: :environment do
		Product.destroy_all

		100.times do |i|
			Product.create!(
				name: FFaker::Product.product_name,
				product_price: FFaker::rand(100..5000),
				description: FFaker::Lorem.paragraph
			)
		end

		puts "have created fake products"
		puts "now you have #{Product.count} products data"
	end
end