class ItemCategoriesController < ApplicationController

	def index
		@categories = ItemCategory.all
	end

	def new
		@category = ItemCategory.new
	end

	def create
		@category = ItemCategory.new(category_params)
		if @category.save
			redirect_to item_categories_path
		else
			render :new
		end
	end

	def edit
		@category = ItemCategory.find(params[:id])
	end

	def update
		@category = ItemCategory.find(params[:id])
		if @category.update_attributes(category_params)
			redirect_to item_categories_path
		else
			render :edit
		end
	end

	def destroy
		@category = ItemCategory.find(params[:id])
		@category.destroy
		redirect_to item_categories_path
	end

	private

	def category_params
		params.require(:item_category).permit(:name)
	end
end
