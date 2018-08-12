require 'spec_helper'

RSpec.describe ItemTaxesController, type: :controller do

	describe "GET #index" do
		it "assigns all ItemTax" do
			item_tax = Factory(:item_tax)
			get :index
			assigns(:item_taxes).should eq([item_tax])
		end
	end

	describe "GET #new" do
		it "assigns a new ItemTax" do
			get :new
			assigns(:item_tax).should be_a_new(ItemTax)
		end
	end

	describe "GET #edit" do 
		it "assigns the itemtax as @itemtax" do
			item_tax = Factory(:item_tax)
			get :edit, params: {id: item_tax.id}
			assigns(:item_tax).should eq(item_tax)
		end
	end

	describe "POST #create" do 
		describe "with valid params" do 
			it "creates a new itemtax" do
				params = Factory.attributes_for(:item_tax)
				expect {
					post :create, params: {:item_tax => params}
				}.to change(ItemTax.all, :count).by(1)
			response.should be_redirect
			end
		end
	end

	describe "POST #create" do 
		describe "with invalid params" do 
			it "creates a new ItemTax" do
				params = Factory.attributes_for(:item_tax)
				params[:name] = ""
				expect {
					post :create, params: {:item_tax => params}
				}.to change(Item.all, :count).by(0)
			end
		end
	end

	describe "Put #update" do 
		describe "with valid params" do 
			it "update item_tax" do
				item_tax = Factory(:item_tax, name: "tom")
				params = item_tax.attributes.slice(*item_tax.class.attribute_names)
				params["name"] = "cruise"
				put :update,params: {:id => item_tax.id, item_tax: params} 
				assigns(:item_tax).should eq(item_tax)
				item_tax.reload
				item_tax.name.should eq("cruise")
				response.should be_redirect
			end
		end
	end

	describe "GET #destroy" do 
		it "delete a item_tax" do
			item_tax = Factory(:item_tax, name: "tom")
			expect {
				delete :destroy, params: {:id => item_tax.id}
			}.to change(ItemTax.all, :count).by(-1)
		end
	end
end