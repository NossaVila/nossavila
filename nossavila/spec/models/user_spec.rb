# /spec/models/user_spec.rb

require 'spec_helper'
require 'faker'

describe User, :pending => true do
    it "is invalid without a firstname" do
        Factory.build(:user, first_name: nil).should_not be_valid
    end
    it "is invalid if firstname length is less than 2 characteres" do
        Factory.build(:user, first_name: "A").should_not be_valid
    end
    it "is invalid without a lastname" do 
        Factory.build(:user, last_name: nil).should_not be_valid
    end
    it "is invalid if lastname length is less than 3 characteres" do
        Factory.build(:user, last_name: "Ivo").should_not be_valid
    end
    it "is invalid without an username" do
        Factory.build(:user, username: nil).should_not be_valid
    end
    it "is invalid without a password" do
        Factory.build(:user, password: nil).should_not be_valid
    end
    it "is invalid without an address" do 
        Factory.build(:user, address: nil).should_not be_valid
    end
    it "is invalid without a cep" do 
        Factory.build(:user, cep: nil).should_not be_valid
    end
    
    it "is invalid if cep lenght is not eight" do
        Factory.build(:user, cep: 131313).should_not be_valid
    end
    it "is invalid without an email" do
        Factory.build(:user, email: nil).should_not be_valid
    end
    it "is invalid without a house number" do
        Factory.build(:user, housenumber: nil).should_not be_valid
    end
    it "is invalid without cpf number" do
        Factory.build(:user, cpf: nil).should_not be_valid
    end
    it "has a valid email" do
        Factory.create(:user).is_valid_email?.should be_true
    end
    it "should have a valid cpf number" do
        Factory.create(:user, cpf: 32442517817).is_valid_cpf?.should be_true
    end
    #métodos de instância
    it "return user's full name as a string" do
         Factory(:user, first_name: "John", last_name: "Thornton").name.should == "John Thornton"
    end
    it "return cep as an integer" do
        Factory(:user, cep: 12345678).cep.should == 12345678
    end
    it ""
end