class Admin::CommentsController < ApplicationController
	def index
		@comments = Comment.all
		@products = Product.all
	end
end
