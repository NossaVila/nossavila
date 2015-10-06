# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController, :pending => true do
    
    let(:valid_attributes) { FactoryGirl.build(:user).attributes }
    let(:invalid_attributes) { FactoryGirl.build(:user, password: nil) }

    describe 'GET show' do
    end

    describe 'POST new' do
        context 'when parameters are valid' do
            it 'creates a new user with the given attributes' do
                expect{ post :new, { :user => valid_attributes } }.to_change{User}.by(1)
            end
            it 'sets a flash[:notice] message' do
                flash[:notice].should eq('Conta criada com sucesso')
            end
            it 'redirects to main page'
        end
        
        context 'when the parameters are invalid' do
            it 'sets an error flash[:notice] message' do
                flash[:notice].should eq('Falha ao criar conta')
            end
            it 'redirects to create account' # re-render?
        end
        
    end
    
    describe 'GET update' do
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
    
    describe 'DELETE destroy' do
        it 'removes the user from db'
        it 'redirects to initial page with a flash[:notice] message'
    end
    
    # login e logout
end