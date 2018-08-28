class Admin::MainsController < Admin::BaseController
	def index
		@products = Product.all
		@comments = Comment.all
		@users = User.all
	end
end
