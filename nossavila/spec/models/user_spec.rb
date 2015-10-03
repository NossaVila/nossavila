# /spec/models/user_spec.rb

require 'user'
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
        Factory.build(:user, house_number: nil).should_not be_valid
    end
    it "is invalid without cpf number" do
        Factory.build(:user, cpf: nil).should_not be_valid
    end
    it "has a valid email" do
        Factory.create(:user).is_valid_email?.should be_true
    end
    it "is invalid with a duplicate email address" do 
        Factory.create(:user, first_name: "John", email: "tester@example.com")
        Factory.build(:user, first_name: "Mary", email: "tester@example.com").should_not be_valid
        end
    it "should have a valid cpf number" do
        Factory.create(:user, cpf: DocumentosBr.cpf).is_valid_cpf?.should be_true
    end
    # métodos de instância
    it "return user's full name as a string" do
         Factory.create(:user, first_name: "John", last_name: "Thornton").name.should == "John Thornton"
    end
    it "return cep as an integer" do
        Factory.create(:user, cep: 12345678).cep.should == 12345678
    end

    #testing attributes

    it "should set the firstname correctly" do
        expect(Factory.create(:user, first_name: "Albert").first_name).to eq("Albert")
    end
    it "should set the lastname correctly" do
        expect(Factory.create(:user, last_name: "Santos").last_name).to eq("Santos")
    end
    it "should set the username correctly" do
        expect(Factory.create(:user, username: "AlSantos" ).username).to eq("AlSantos")
    end
    it "should set the password correctly" do
        expect(Factory.create(:user, password: "Ab5ertd").password).to eq("Ab5ertd")
    end
    it "should set the address correctly" do
        expect(Factory.create(:user, address: "Rua das Palmeiras").address).to eq("Rua das Palmeiras")
    end
    it "should set the house number correctly" do
        expect(Factory.create(:user, house_number: 29).house_number).to eq(29)
    end
    it "should set the email correctly" do
        expect(Factory.create(:user, email: "mario@gmail.com").email).to eq("mario@gmail.com")
    end
    it "should set the cpf correctly" do
        expect(Factory.create(:user, cpf: 12345678910).address).to eq(12345678910)
    end
end 