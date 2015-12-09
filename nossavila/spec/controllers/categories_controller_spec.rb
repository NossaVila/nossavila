require 'spec_helper'

describe CategoriesController do
    
    let(:valid_attributes) { {name: 'Transportes'} }
    let(:valid_session) { {} }
    
    describe 'GET index' do
        it "assigns all categories as @categories" do
            root = Category.create!({:name => "root"})
            category = Category.create! valid_attributes
            root.subcategories << category
            category.supercategory = root
            get :index, {}, valid_session
            expect(assigns(:categories)).to eq([])
        end
    end
    
    describe "GET #show" do
        it "assigns the requested category as @category" do
            root = Category.create!({:name => "root"})
            category = Category.create! valid_attributes
            root.subcategories << category
            category.supercategory_id = root.id
            get :show, {:id => category.to_param} , valid_session
            expect(assigns(:category)).to eq(category)
        end
    end
end