# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController, :pending => true do

    describe 'create a new user account' do
        it 'calls create on account when POST create is called'
        it 'creates a new user with the given attributes'
        it 'saves the new user account'
        
        context 'when the user account saves successfully' do
            it 'sets a flash[:notice] message' do
                flash[:notice].should eq('Conta criada com sucesso.')
            end
            it 'redirects to main page'
        end
        
        context 'when the user account fails to save' do
            it 'sets a flash[:notice] message' do
                flash[:notice].should eq('Falha ao criar conta')
            end
            it 'redirects to create account'
        end
        
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