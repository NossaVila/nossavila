# spec/models/category.rb
require 'spec_helper'

describe Category, :pending => true do
    it 'should not be valid without a name' do
        FactoryGirl.build(:category, name: nil).should_not be_valid
    end
    
    it 'should validate class_name' do
        expect(Factory)
    end
    
    describe 'relations' do
        it 'should have many services' do
        end
        it 'should have many subcategories' do
        end
    end
    
    describe 'attributes' do
        it 'should set name' do
            expect(FactoryGirl.build(:category).name).to eq("Transportation")
        end
    end
end