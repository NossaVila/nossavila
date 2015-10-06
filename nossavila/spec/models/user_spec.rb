# /spec/models/user_spec.rb

require 'user'
require 'spec_helper'
require 'faker'
require 'user_helper'

describe User do
    it "is invalid without a firstname" do
        FactoryGirl.build(:user, first_name: nil).should_not be_valid
    end
    it "is invalid if firstname length is less than 2 characteres" do
        FactoryGirl.build(:user, first_name: "A").should_not be_valid
    end
    it "is invalid without a lastname" do 
        FactoryGirl.build(:user, last_name: nil).should_not be_valid
    end
    it "is invalid if lastname length is less than 3 characteres" do
        FactoryGirl.build(:user, last_name: "Io").should_not be_valid
    end
    it "is invalid without an username" do
        FactoryGirl.build(:user, username: nil).should_not be_valid
    end
    it "is invalid without a password" do
        FactoryGirl.build(:user, password: nil).should_not be_valid
    end
    it "is invalid without an address" do 
        FactoryGirl.build(:user, address: nil).should_not be_valid
    end
    it "is invalid without a cep" do 
        FactoryGirl.build(:user, cep: nil).should_not be_valid
    end
    it "is invalid if cep lenght is not eight" do
        FactoryGirl.build(:user, cep: 131313).should_not be_valid
    end
    it "is invalid without an email" do
        FactoryGirl.build(:user, email: nil).should_not be_valid
    end
    it "is invalid without a house number" do
        FactoryGirl.build(:user, housenumber: nil).should_not be_valid
    end
    it "is invalid without cpf number" do
        FactoryGirl.build(:user, cpf: nil).should_not be_valid
    end
    it "has a valid email" do
        FactoryGirl.create(:user).email.should be_truthy
    end
    it "is invalid with a duplicate email address" do 
        FactoryGirl.create(:user, first_name: "John", email: "tester@example.com")
        FactoryGirl.build(:user, first_name: "Mary", email: "tester@example.com").should_not be_valid
        end
    it "should have a valid cpf number" do
        FactoryGirl.create(:user, cpf: 36909492870).is_valid_cpf?.should be_truthy
    end
    # métodos de instância
    it "return user's full name as a string" do
         FactoryGirl.create(:user, first_name: "John", last_name: "Thornton").name.should == "John Thornton"
    end
    it "return cep as an integer" do
        FactoryGirl.create(:user, cep: 12345678).cep.should == "12345678"
    end

    #testing attributes

    it "should set the firstname correctly" do
        expect(FactoryGirl.create(:user, first_name: "Albert").first_name).to eq("Albert")
    end
    it "should set the lastname correctly" do
        expect(FactoryGirl.create(:user, last_name: "Santos").last_name).to eq("Santos")
    end
    it "should set the username correctly" do
        expect(FactoryGirl.create(:user, username: "AlSantos" ).username).to eq("AlSantos")
    end
    it "should set the password correctly" do
        expect(FactoryGirl.create(:user, password: "Ab5ertdf").password).to eq("Ab5ertdf")
    end
    it "should set the address correctly" do
        expect(FactoryGirl.create(:user, address: "Rua das Palmeiras").address).to eq("Rua das Palmeiras")
    end
    it "should set the house number correctly" do
        expect(FactoryGirl.create(:user, housenumber: 13).housenumber).to eq(13)
    end
    it "should set the email correctly" do
        expect(FactoryGirl.create(:user, email: "mario@gmail.com").email).to eq("mario@gmail.com")
    end
    it "should set the cpf correctly" do
        expect(FactoryGirl.create(:user, cpf: 12345678910).cpf).to eq("12345678910")
    end
end 