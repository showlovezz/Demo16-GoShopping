class MainsController < ApplicationController
	def index
		@products = product_list.most_recent.page(params[:page]).per(12)
		@categories = Category.all
	end

	private

	def product_list
		Product.published
	end
end
