# spec/controllers/services_controller_spec.rb
require 'spec_helper'

describe ServicesController, :pending => true do
    
    let(:valid_attributes) { FactoryGirl.build(:service).attributes }
    let(:invalid_attributes) { FactoryGirl.build(:service, title: nil).attributes }

    describe 'GET index' do
        it 'renders the "index" template' do
            expect(response).to render_template("index")
        end
        it 'loads all of the services into @services' do
            serviceA = FactoryGirl.build(:service)
            serviceB = FactoryGirl.build(:service)
            get :index
            expect(assigns(:service)).to match_array([serviceA, serviceB])
        end
    end
    
    describe 'GET show' do
        it 'assigns the requested service to @service' do
            get :show, service => FactoryGirl(:service)
            assigns(:service).should eq(service)
        end
  
        it 'renders the "show" template' do
            get :show, service => FactoryGirl(:service)
            expect(response).to render_template("show")
        end
    end
    
    describe 'POST new"' do
        context 'with valid attributes' do
            it 'creates a new service' do
                expect{ post :new, { :service => valid_attributes} }.to change(Service, :count).by(1)
            end
            it 'sets a flash[:notice] message' do
                flash[:notice].should eq('Novo serviço criado com sucesso')
            end
            it 'redirecs to the service page' do
                response.should redirect_to(@service)
            end
        end
        
        context 'with invalid attributes' do
            it 'sets a flash[:notice] message' do
                flash[:notice].should eq("Falha ao criar serviço")
            end
            it 're-renders the "new" template' do
                expect(response).to render_template("new")
            end
        end
    end

    
end