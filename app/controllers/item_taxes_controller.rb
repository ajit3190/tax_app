class ItemTaxesController < ApplicationController
	def index
		@item_taxes = ItemTax.all
	end

	def new
		@items = Item.all
		@item_tax = ItemTax.new
	end

	def create
		@item_tax = ItemTax.new(item_tax_params)
		if @item_tax.save
			redirect_to item_taxes_path
		else
			@items = Item.all
			render :new
		end
	end

	def edit
		@items = Item.all
		@item_tax = ItemTax.find(params[:id])
	end

	def update
		@item_tax = ItemTax.find(params[:id])
		if @item_tax.update_attributes(item_tax_params)
			redirect_to item_taxes_path
		else
			@items = Item.all
			render :edit
		end
	end

	def destroy
		@item_tax = ItemTax.find(params[:id])
		@item_tax.destroy
		redirect_to item_taxes_path
	end

	private

	def item_tax_params
		params.require(:item_tax).permit(:name, :tax_type, :tax, :item_id)
	end
end
