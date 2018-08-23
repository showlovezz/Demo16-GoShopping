class Product < ApplicationRecord
	validates :name, :description, :product_price, presence: true

	mount_uploader :product_image, PhotoUploader

	has_many :comments, dependent: :destroy

	belongs_to :category, optional: true
end
