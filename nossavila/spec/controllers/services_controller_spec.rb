require 'spec_helper'

describe ServicesController do

	let(:valid_attributes) {
    {title: 'Artesanato', description: 'Belos trabalhos feitos artesanalmente'}
    }
    
    let(:invalid_attributes) { {title: nil, description: nil } }

    let(:valid_session) { {} }
    
    let(:user) { [FactoryGirl.build(:user)] }
    
  describe "GET #index" do
    it "assigns all services as @services" do
      service = Service.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:services)).to eq([service])
    end
  end


  describe "GET #show" do
    it "assigns the requested service  as @service" do
      service = Service.create! valid_attributes
      get :show, {}, valid_session
      expect(assigns(:services)).to eq(service)
    end
  end

  describe "GET #new" do
    it "assigns a new service as @service" do
      service = Service.create! valid_attributes
      get :new, {}, valid_session
      expect(assigns(:services)).to eq([service])
      expect(assigns(:service)).to be_a_new(Service)
    end
  end

  describe "GET #new" do
    let(:services) { [FactoryGirl.build(:service)] }

    before :each do
      get :new, {}, valid_session
    end

    it { is_expected.to render_template(:new) }
  end
  
  describe "GET #edit" do
    it "assigns the requested service as @service" do
      service = Service.create! valid_attributes
      get :edit, {:service => valid_attributes}, valid_session
      expect(assigns(:service)).to eq(service)
    end
  end
    
  describe "POST #create" do
    context "with valid params" do
      it "creates a new service" do
        expect {
          post :create, {:service => valid_attributes}, valid_session
        }.to change(Service, :count).by(1)
      end

      it "assigns a newly created service as @service" do
        post :create, {:service => valid_attributes}, valid_session
        expect(assigns(:service)).to be_a(Service)
        expect(assigns(:service)).to be_persisted
      end

      it "redirects to the created service" do
        post :create, {:service => valid_attributes}, valid_session
        expect(response).to redirect_to(Service.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved service as @service" do
        post :create, {:service => invalid_attributes}, valid_session
        expect(assigns(:service)).to be_a_new(Service)
      end

      it "renders the 'new' template" do
        post :create, {:service => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {description: 'Say all you need to say'}
      }

      it "updates the requested service" do
        service = Service.create! valid_attributes
        put :update, {:id => service.to_param, :service => new_attributes}, valid_session
        service.reload
      end

      it "assigns the requested service as @service" do
        service = Service.create! valid_attributes
        put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
        expect(assigns(:service)).to eq(service)
      end

      it "redirects to the service" do
        service = Service.create! valid_attributes
        put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
        expect(response).to redirect_to(service)
      end
    end

    context "with invalid params" do
      it "assigns the service as @service" do
        service = Service.create! valid_attributes
        put :update, {:id => service.to_param, :service => invalid_attributes}, valid_session
        expect(assigns(:service)).to eq(service)
      end

      it "renders the 'edit' template" do
        service = Service.create! valid_attributes
        put :update, {:id => service.to_param, :service => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested service" do
      service = Service.create! valid_attributes
      expect {
        delete :destroy, {:id => service.to_param}, valid_session
      }.to change(Service, :count).by(-1)
    end

    it "redirects to the services list" do
      service = Service.create! valid_attributes
      delete :destroy, {:id => service.to_param}, valid_session
      expect(response).to redirect_to(services_url)
    end
  end

end

