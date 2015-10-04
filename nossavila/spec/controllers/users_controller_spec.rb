# spec/controllers/users_controller_spec.rb
require 'spec_helper'


# estudar mock para usar aqui
# Mock the models and stub their methods (Rspec style guide about controllers)

describe UsersController, :pending => true do
    #  let(:.....) { mock_model(.......) }
    
    describe 'create a new user account' do
        it 'calls create on account when POST create is called'
        it 'creates a new user with the given attributes'
        it 'saves the new user account'
        
        context 'when the user account saves successfully' do
            it 'sets a flash[:notice] message' do
            # CODE!
            flash[:notice].should eq('Conta criada com sucesso.') # improve this!
            end
            
            it 'redirects to main page' # or user profile?
        end
        
        context 'when the user account fails to save'
        # CODE
    end
    
    describe 'update user info' do
        it 'changes the given attributes of user'
        it 'saves user with new attribute updated'
        
        context 'when the attribute fails to update' do
            it 'sets an error message'
            it 'redirects to main page'
        end
        
        context 'when attribute saves successfully' do
            it 'redirects to user profile'
            it 'sets a flash[:notice] message'
        end
    end
    
    describe 'destroy user account' do
        it 'removes the user from db'
        it 'redirects to initial page with a flash[:notice] message'
    end
    
    
end