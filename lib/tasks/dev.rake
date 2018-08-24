namespace :dev do
	task fake_product: :environment do
		Product.destroy_all

		50.times do |i|
			Product.create!(
				name: FFaker::Product.product_name,
				product_price: FFaker::rand(1000..3000),
				description: FFaker::Lorem.paragraph,
				category_id: Category.all.sample.id
			)
		end

		puts "Have created fake products"
		puts "Now you have #{Product.count} products data"
	end

	task fake_user: :environment do
		5.times do |i|
			user_name = FFaker::Name.first_name
			User.create!(
				email: "#{user_name}@example.com",
				password: 12345678
			)
		end
		puts "Have created fake users"
    puts "Now you have #{User.count} users data"
  end

  task fake_comment: :environment do
  	Comment.destroy_all

		Product.all.each do |product|
			5.times do |i|
				product.comments.create!(
					content: FFaker::Lorem.sentence,
					user: User.all.sample
				)
			end
		end
		puts "Have created fake comments"
    puts "Now you have #{Comment.count} comment data"
	end
end