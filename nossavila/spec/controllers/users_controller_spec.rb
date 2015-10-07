# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController, :pending => true do
    
    let(:valid_attributes) { FactoryGirl.build(:user).attributes }
    let(:invalid_attributes) { FactoryGirl.build(:user, password: nil).attributes }

    describe 'GET show' do
        it "assigns the requested user to @user" do
            contact = Factory(:contact)
            get :show, user => valid_attributes
            assigns(:user).should eq(user)
        end
  
        it "renders the show view" do
            get :show, user => valid_attributes
            expect(response).to render_template("show")
        end
    end

    describe 'POST new' do
        context 'when parameters are valid' do
            it 'creates a new user with the given attributes' do
                expect{ post :new, { :user => valid_attributes } }.to change(User,  :count).by(1)
            end
            it 'sets a flash[:notice] message' do
                flash[:notice].should eq('Conta criada com sucesso')
            end
            it 'redirects to main page' do
                post :new, :user => valid_attributes
                response.should redirect_to(panels_path)
            end
        end
        
        context 'when the parameters are invalid' do
            it 'assigns a newly created but unsaved user' do
                expect { post :new, { user => invalid_attributes } }.to be_a_new(User)
            end
            it 'sets an error flash[:notice] message' do
                flash[:notice].should eq('Falha ao criar conta')
            end
            it 're-renders the "new" template' do
                post :new, user => invalid_attributes
                expect(response).to render_template("new")
            end
        end
        
    end
    
    describe 'PUT update' do
        before :each do
            @user = FactoryGirl.build(:user, first_name: "Fitzwilliam", last_name: "Flowers")
        end
        it 'saves user with new attribute updated' do
            put :update, id => @user, 
            user => FactoryGirl.build(:user, first_name: "Fitzwilliam", last_name: "Flowers")
            @user.reload
            @user.first_name.should eq("Fitzwilliam")
            @user.last_name.should eq("Flowers")
        end
      context 'when the attribute fails to update' do
            it 'sets an error message' do
                flash[:notice].should eq('Falha ao atualizar dados')
            end
            it 're-rends the "update" template' do
                expect(response).to render_template("update")
            end
            
        end
        
        context 'when attribute saves successfully' do
            it 'sets a flash[:notice] message' do
                flash[:notice].should eq('Dados atualizados com sucesso')
            end
            it 'redirects to user profile' do
                response.should redirect_to(@user)
            end
        end
    end
    
    describe 'DELETE destroy' do
        it 'removes the user from db' do
            expect{ delete :destroy, { :user => valid_attributes } }.to change(User,  :count).by(-1)
        end
        it 'sets a flash[:notice] message' do
            flash[:notice].should eq('Usuário removido com sucesso')
        end
            it 'redirects to main page' do
                response.should redirect_to(root_path)
            end
    end
    
end