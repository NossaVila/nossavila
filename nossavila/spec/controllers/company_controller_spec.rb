require 'spec_helper'

describe CompaniesController do
    
    let(:valid_attributes) {
    FactoryGirl.build(:company, name: 'Doceria', description: 'compre felicidade') }
    let(:invalid_attributes) { {title: nil, description: nil } }
    let(:valid_session) { {} }
    let(:user) { [FactoryGirl.build(:user)] }
    
    describe "GET #index" do
        it "assigns all companies as @companies" do
            company = valid_attributes
            get :index, {}
            expect(assigns(:company)).to eq([company])
        end
    end
    
    describe "GET #show" do
        it "assigns the requested companies as @company" do
          company = valid_attributes
         get :show, {:id => company.to_param}, valid_session
         expect(assigns(:company)).to eq(company)
        end
    end
    
  describe "GET #new" do
    it "assigns a new company as @company" do
      company = valid_attributes
      get :new, {:id => company.to_param}, valid_session
      expect(assigns(:companies)).to eq([company])
      expect(assigns(:company)).to be_a_new(Company)
    end
  end

  describe "GET #new" do
    let(:companies) { [FactoryGirl.build(:company)] }

    before :each do
      get :new, {}
    end
    it 'redirect to new_user_session_path if user is not logged in' do
     expect(response).to redirect_to(new_user_session_path)
    end
  end
  
  describe "GET #edit" do
    it "assigns the requested company as @company" do
      company = valid_attributes
      get :edit, {:id => company.to_param}
      expect(assigns(:company)).to eq(company)
    end
  end
    
  describe "POST #create" do
    context "with valid params" do
      it "creates a new company" do
        expect {
          root = Category.create!({:name => "root"})
          post :create, {:company => valid_attributes }
        }.to change(Company, :count).by(1)
      end

      it "assigns a newly created company as @company" do
        root = Category.create!({:name => "root"})
        post :create, {:company => valid_attributes}
        expect(assigns(:company)).to be_a(Company)
        expect(assigns(:company)).to be_persisted
      end

      it "redirects to the created company" do
        root = Category.create!({:name => "root"})
        post :create, {:company => valid_attributes}
        expect(response).to redirect_to(Company.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved company as @company" do
        root = Category.create!({:name => "root"})
        post :create, {:company => invalid_attributes}
        expect(assigns(:company)).to be_a_new(Company)
      end

      it "renders the 'new' template" do
        root = Category.create!({:name => "root"})
        post :create, {:company => invalid_attributes} 
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { description: 'To be or not to be' }
      }

      it "updates the requested company" do
        company = valid_attributes
        put :update, {:id => company.to_param, :company => new_attributes}
        company.reload
      end

      it "assigns the requested company as @company" do
        company =  valid_attributes
        put :update, {:id => company.to_param, :company => valid_attributes}
        expect(assigns(:company)).to eq(company)
      end

      it "redirects to the company" do
        company =  valid_attributes
        put :update, {:id => company.to_param, :company => valid_attributes}
        expect(response).to redirect_to(company)
      end
    end

    context "with invalid params" do
      it "assigns the company as @company" do
      company =  valid_attributes
      put :update, {:id => company.to_param, :company => invalid_attributes}
      expect(assigns(:company)).to eq(company)
      end

      it "renders the 'edit' template" do
        company =  valid_attributes
        put :update, {:id => company.to_param, :company => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested company" do
      company =  valid_attributes
      expect {
        delete :destroy, {:id => company.to_param}
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companies list" do
      company = valid_attributes
      delete :destroy, {:id => company.to_param}
      expect(response).to redirect_to(companies_url)
    end
  end    
    
end