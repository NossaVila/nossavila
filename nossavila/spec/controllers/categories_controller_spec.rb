require 'spec_helper'

describe CategoriesController do
    
    let(:valid_attributes) { {name: 'Transportes', supercategory_id: '1' } }
    let(:valid_session) { {} }
    
    describe 'GET index' do
        it "assigns all categories as @categories" do
            category = Category.create! valid_attributes
            get :index, {}, valid_session
            expect(assigns(:categories)).to eq([category])
        end
    end
    
    describe "GET #show" do
        it "assigns the requested category  as @category" do
           category = Category.create! valid_attributes
           get :show, {:id => category.to_param} , valid_session
           expect(assigns(:category)).to eq(category)
        end
    end
end