require 'spec_helper'

describe CategoriesController, :pending=> true do

    describe 'GET index' do
        it 'renders the "index" template' do
            expect(response).to render_template("index")
        end
        it 'loads all of the categories into @categories' do
            categoryA = FactoryGirl.build(:category)
            categoryB = FactoryGirl.build(:category)
            get :index
            expect(assigns(:categories)).to match_array([categoryA, categoryB])
        end
    end
    describe 'GET show' do
        it 'assigns the requested category to @category' do
            get :show, category => FactoryGirl(:category)
            assigns(:category).should eq(category)
        end
  
        it 'renders the "show" template' do
            get :show, category => FactoryGirl(:category)
            expect(response).to render_template("show")
        end
    end
end
