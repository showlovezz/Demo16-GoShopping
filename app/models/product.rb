class Product < ApplicationRecord
	validates :name, :description, :product_price, presence: true

	mount_uploader :product_image, PhotoUploader
end
