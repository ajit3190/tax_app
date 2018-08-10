class HomeController < ApplicationController

	def item_list
		@categories = ItemCategory.all
	end

	def display_bill
		@items = Item.where(id: params["items"])
		@total_amount = @items.sum(:actual_price)
	end
end
