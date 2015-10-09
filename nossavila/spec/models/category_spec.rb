# spec/models/category.rb
require 'spec_helper'

describe Category do

    it { should validate_presence_of(:name) }
    
    describe 'relations' do
        it { should have_and_belong_to_many(:services) }
        it { is_expected.to have_many(:subcategories).class_name('Category').with_foreign_key(:supercategory_id) }
        it { should belong_to(:supercategory).class_name('Category') }
    end
    
    describe 'attributes' do
        it 'should set name' do
            expect(FactoryGirl.build(:category).name).to eq("Transportation")
        end
    end
end