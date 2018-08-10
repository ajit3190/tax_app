class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def new
		@categories = ItemCategory.all
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to items_path
		else
			@categories = ItemCategory.all
			render :new
		end
	end

	def edit
		@categories = ItemCategory.all
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update_attributes(item_params)
			redirect_to items_path
		else
			@categories = ItemCategory.all
			render :edit
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to item_categories_path
	end

	private

	def item_params
		params.require(:item).permit(:name, :price, :item_category_id)
	end
end
