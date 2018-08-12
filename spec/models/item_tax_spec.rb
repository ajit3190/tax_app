require 'spec_helper'
describe ItemTax do
    context 'association' do
        it { should belong_to(:item) }
    end


    context 'validation' do
        [:name, :tax_type, :tax].each do |att|
            it { should validate_presence_of(att) }
            
        end
    end

    context 'uniqueness of item' do 
	    it "should return error if item is snot unique" do
	    	item1 = Factory(:item )
	    	item_tax = Factory(:item_tax, item: item1)
	    	item_tax1 = Factory.build(:item_tax, item: item1)
	    	item_tax1.should_not be_valid
		end
    end
end