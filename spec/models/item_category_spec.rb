require 'spec_helper'
describe ItemCategory do
    context 'association' do
        it { should have_many(:items).dependent(:destroy) }
    end

    context 'validation' do
        [:name].each do |att|
            it { should validate_presence_of(att) }
            it { should validate_uniqueness_of(att) }
        end
    end
end