class Admin::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "產品建立成功"
			redirect_to admin_products_path
		else
			flash.now[:alert] = "產品建立失敗，是不是少了什麼 !?"
			render :new
		end
	end

	private

	def product_params
		params.require(:product).permit(:name, :product_price, :description)
	end
end
