class CommentsController < ApplicationController
	
	before_action :find_product, only: [:index, :create, :destroy]

	def index
		@comments = @product.comments.order("created_at DESC")
		@comment = Comment.new
		@random_product = Product.where.not(id: @product.id).order("RANDOM()").limit(3)
	end

	def create
		@comment = @product.comments.build(comment_params)
		@comment.user = current_user
		@comment.save!
		redirect_to product_comments_path
	end

	def destroy
		@comment = Comment.find(params[:id])

		if current_user.admin?
			@comment.destroy
			redirect_to product_comments_path
		end
	end

	private

	def find_product
		@product = Product.find(params[:product_id])
	end

	def comment_params
		params.require(:comment).permit(:content)
	end
end
