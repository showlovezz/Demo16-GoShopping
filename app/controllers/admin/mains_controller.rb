class Admin::MainsController < Admin::BaseController
	def index
		@products = Product.all
	end
end
