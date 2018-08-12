FactoryGirl.define do
  	factory :item_tax do 
	    name "temptation"
	    item_id {Factory(:item).id} 
	    tax_type "percentage"
	    tax 10
	end
end