class Admin::ProductsController < ApplicationController
	
	before_action :find_product, only: [:show, :edit, :update]

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "產品建立成功。"
			redirect_to admin_products_path
		else
			flash.now[:alert] = "產品建立失敗，是不是少了什麼 !?"
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @product.update(product_params)
			flash[:notice] = "產品修改資料成功。"
			redirect_to admin_products_path
		else
			flash.now[:alert] = "產品修改失敗，是不是少了什麼 !?"
			render :edit
		end
	end

	private

	def product_params
		params.require(:product).permit(:name, :product_price, :description)
	end

	def find_product
		@product = Product.find(params[:id])
	end
end
