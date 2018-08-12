require 'spec_helper'

RSpec.describe HomeController, type: :controller do

	describe "GET #item_list" do
		it "assigns all ItemTax" do
			item_category = Factory(:item_category)
			get :item_list
			assigns(:categories).should eq([item_category])
		end
	end

	describe "GET #display_bill" do
		it "assigns all ItemTax" do
			item = Factory(:item)
			get :display_bill, params: {items: [1]}
			assigns(:items).should eq([item])
			assigns(:total_amount).should eq(item.actual_price)
		end
	end
end