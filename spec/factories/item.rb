FactoryGirl.define do
  factory :item do 
    name "temptation"
    item_category_id {Factory(:item_category).id} 
    price 100
    actual_price 90
	end
end