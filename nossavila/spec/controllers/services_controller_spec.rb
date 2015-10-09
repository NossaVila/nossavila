# spec/controllers/services_controller_spec.rb
require 'spec_helper'

describe ServicesController do
    
    let(:valid_attributes) { {title: 'newService', description: 'Say all you need to say'} }

    describe 'GET index' do
        it 'assigns all services as @service' do
            service = Service.create! valid_attributes
            get :index, {}
            expect(assigns(:services)).to eq([service])
        end
    end
    
    describe 'GET show' do
      
        it 'assigns the requested service to @service' do
            service = Service.create! valid_attributes
            get :show, id: service.to_param
            assigns(:service).should eq(service)
        end
 
        it 'renders the "show" template' do
            service = Service.create! valid_attributes
            get :show, id = service.to_param
            expect(response).to render_template("show")
        end
    end
    
    describe 'GET new' do
        it "assigns a new service as @service" do
           service = Service.create! valid_attributes
            get :new, {}
            expect(assigns(:services)).to eq([service])
            expect(assigns(:service)).to be_a_new(Service)
        end
    
        let(:service) { [FactoryGirl.build(:service)] }
        before :each do
            get :new, {}
        end
        it { is_expected.to render_template(:new) }
    end
    
    describe 'POST create' do

        context 'with valid attributes' do
            it 'creates a new service' do
                expect{ post :create, { :service => valid_attributes } }.to change(Service, :count).by(1)
            end
            it 'sets a flash[:notice] message' do
                post :create
                flash[:notice].should eq("Novo serviço criado com sucesso")
            end
            it 'redirects to the service page' do
                post :create, { :service => valid_attributes }
                response.should redirect_to(Service.last)
            end
        end
        
        context 'with invalid attributes' do
            it 'sets a flash[:notice] message' do
                post :create
                flash[:notice].should eq("Falha ao criar serviço")
            end
            it 'renders the "new" template' do
                post :create
                expect(response).to render_template("new")
            end
        end
    end
    
    describe 'PUT update' do
        
        let(:new_attributes) { {description: 'Say all you need to say'} }

        it 'saves service with new attributes updated' do
            service = Service.create! valid_attributes
            put :update, {:id => service.to_param, :service => new_attributes}
            service.reload
        end	
        it "assigns the requested service as @service" do
            service = Service.create! valid_attributes
            put :update, {:id => service.to_param, :service => valid_attributes}
            expect(assigns(:service)).to eq(service)
        end
        
        context 'when the attribute fails to update' do 	
            it 'sets an error message' do
                put :update
                flash[:notice].should eq('Falha ao atualizar serviço') 	
            end 	
            it 're-rends the "update" template' do 	
                put :update
                expect(response).to render_template("update") 	
            end 	
        end 	
        
        context 'when attribute saves successfully' do 	
            it 'sets a flash[:notice] message' do 	
              #  put :update
                flash[:notice].should eq('Dados atualizados com sucesso') 	
            end
            it 'redirects to service page' do 	
                response.should redirect_to(@service) 	
            end 	
        end
    end

    describe 'DELETE destroy' do
        it 'removes the service from db' do 	
            expect{ delete :destroy, { :service => Service.create(:title => "newTitle")} }.to change(Service, :count).by(-1) 	
        end 	
        it 'sets a flash[:notice] message' do
            delete :destroy
            flash[:notice].should eq('Serviço removido') 	
        end 	
        it 'redirects to main page' do 	
            response.should redirect_to(root_path) 	
        end
    end
end