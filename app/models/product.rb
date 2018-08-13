class Product < ApplicationRecord
	validates :name, :description, :product_price, presence: true
end
