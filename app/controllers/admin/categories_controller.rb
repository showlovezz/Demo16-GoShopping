class Admin::CategoriesController < Admin::BaseController

  before_action :find_category, only: [ :edit, :update, :destroy]

  def index
  	@categories = Category.all
  end

  def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "產品分類建立成功。"
			redirect_to admin_categories_path
		else
			flash.now[:alert] = "產品分類建立失敗，是不是少了什麼 !?"
			render :new
		end
	end

	def edit
	end

	def update
		if @category.update(category_params)
			flash[:notice] = "產品修改資料成功。"
			redirect_to admin_categories_path
		else
			flash.now[:alert] = "產品分類修改失敗，是不是少了什麼 !?"
			render :edit
		end
	end

	def destroy
		@category.destroy
		flash[:alert] = "商品已被刪除。"
		redirect_to admin_categories_path
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

	def find_category
		@category = Category.find(params[:id])
	end
end
