require 'spec_helper'

RSpec.describe ItemCategoriesController, type: :controller do 

	before(:each) do
		request.env["HTTP_REFERER"] = "/"
	end

	describe "GET #index" do
		it "assigns all item_categories" do
			item_categories = Factory(:item_category)
			get :index
			assigns(:categories).should eq([item_categories])
		end
	end

	describe "GET #new" do
		it "assigns a new item_categories" do
			get :new
			assigns(:category).should be_a_new(ItemCategory)
		end
	end

	describe "GET #edit" do 
		it "assigns the category as @category" do
			item_category = Factory(:item_category)
			get :edit, params: {id: item_category.id}
			assigns(:category).should eq(item_category)
		end
	end

	describe "POST #create" do 
		describe "with valid params" do 
			it "creates a new category" do
				params = Factory.attributes_for(:item_category)
				expect {
					post :create, params: {:item_category => params}
				}.to change(ItemCategory.all, :count).by(1)
			response.should be_redirect
			end
		end
	end

	describe "POST #create" do 
		describe "with invalid params" do 
			it "creates a new category" do
				params = Factory.attributes_for(:item_category)
				params[:name] = ""
				expect {
					post :create, params: {:item_category => params}
				}.to change(ItemCategory.all, :count).by(0)
			end
		end
	end

	describe "Put #update" do 
		describe "with valid params" do 
			it "edit category" do
				item_category = Factory(:item_category, name: "tom")
				params = item_category.attributes.slice(*item_category.class.attribute_names)
				params["name"] = "cruise"
				put :update,params: {:id => item_category.id, item_category: params} 
				assigns(:category).should eq(item_category)
				item_category.reload
				item_category.name.should eq("cruise")
				response.should be_redirect
			end
		end
	end

	describe "GET #destroy" do 
		it "delete a category" do
			item_category = Factory(:item_category, name: "tom")
			expect {
				delete :destroy, params: {:id => item_category.id}
			}.to change(ItemCategory.all, :count).by(-1)
		end
	end
end