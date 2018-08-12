require 'spec_helper'
describe Item do
    context 'association' do
        it { should belong_to(:item_category) }
        it { should have_one(:item_tax).dependent(:destroy) }
    end

	context 'validation' do
        [:name, :price].each do |att|
          it { should validate_presence_of(att) }
        end
    end

    it "should return error if price smaller than zero" do
    	item = Factory.build(:item, price: -1 )
    	item.should_not be_valid
        item.errors[:price] == ["Price must be greater than 0.0"]
	end

    it "should return error if price smaller than zero" do
        item1 = Factory.build(:item, price: 100 )
        item1.should be_valid
    end

end