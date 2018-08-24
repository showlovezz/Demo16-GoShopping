class Product < ApplicationRecord
	validates :name, :description, :product_price, presence: true

	mount_uploader :product_image, PhotoUploader

	has_many :comments, dependent: :destroy
	belongs_to :category, optional: true

	scope :most_recent, -> { order(published_at: :desc) }
	scope :published, -> { where(published: true) }

	def publish
		update(published: true, published_at: Time.now)
	end

	def unpublish
		update(published: false, published_at: nil)
	end
end
