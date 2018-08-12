require 'spec_helper'

RSpec.describe ItemsController, type: :controller do 

	before(:each) do
		request.env["HTTP_REFERER"] = "/"
	end

	describe "GET #index" do
		it "assigns all item" do
			item = Factory(:item)
			get :index
			assigns(:items).should eq([item])
		end
	end

	describe "GET #new" do
		it "assigns a new item" do
			get :new
			assigns(:item).should be_a_new(Item)
		end
	end

	describe "GET #edit" do 
		it "assigns the item as @item" do
			item = Factory(:item)
			get :edit, params: {id: item.id}
			assigns(:item).should eq(item)
		end
	end

	describe "POST #create" do 
		describe "with valid params" do 
			it "creates a new item" do
				params = Factory.attributes_for(:item)
				expect {
					post :create, params: {:item => params}
				}.to change(Item.all, :count).by(1)
			response.should be_redirect
			end
		end
	end

	describe "POST #create" do 
		describe "with invalid params" do 
			it "creates a new Item" do
				params = Factory.attributes_for(:item)
				params[:name] = ""
				expect {
					post :create, params: {:item => params}
				}.to change(Item.all, :count).by(0)
			end
		end
	end

	describe "Put #update" do 
		describe "with valid params" do 
			it "creates a new item" do
				item = Factory(:item, name: "tom")
				params = item.attributes.slice(*item.class.attribute_names)
				params["name"] = "cruise"
				put :update,params: {:id => item.id, item: params} 
				assigns(:item).should eq(item)
				item.reload
				item.name.should eq("cruise")
				response.should be_redirect
			end
		end
	end

	describe "GET #destroy" do 
		it "delete a item" do
			item = Factory(:item, name: "tom")
			expect {
				delete :destroy, params: {:id => item.id}
			}.to change(Item.all, :count).by(-1)
		end
	end
end