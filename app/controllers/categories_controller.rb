class CategoriesController < ApplicationController

	def show
		@categories = Category.all
		@category = Category.find(params[:id])
		@products = products_list.most_recent.page(params[:page]).per(12)
	end

	private

	def products_list
		@category.products.published
	end
end
