class MainsController < ApplicationController
	def index
		@products = Product.page(params[:page]).per(12)
		@categories = Category.all
	end
end
