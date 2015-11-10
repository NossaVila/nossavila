# /spec/models/company_spec.rb
require 'company'
require 'spec_helper'
require 'faker'

describe Company do
    
    it 'is invalid without a name' do
        FactoryGirl.build(:company, name: nil).should_not be_valid
    end
    
    it 'is invalid if name length is less than 2 characteres' do
        FactoryGirl.build(:company, name: "A").should_not be_valid
    end
    
    it 'is invalid without a description' do
        FactoryGirl.build(:service, description: nil).should_not be_valid
  end
    
    it 'is invalid without an address' do 
        FactoryGirl.build(:company, address: nil).should_not be_valid
    end
    
    it 'is invalid without a cep' do 
        FactoryGirl.build(:company, cep: nil).should_not be_valid
    end
    
    it 'is invalid if cep length is not eight' do
        FactoryGirl.build(:company, cep: 131313).should_not be_valid
    end
  
    it 'is invalid without cnpj number' do
        FactoryGirl.build(:company, cnpj: nil).should_not be_valid
    end
    
    it 'should have a valid cnpj number' do
        FactoryGirl.build(:company, cnpj: 36909492870).should be_valid
    end
    
    it 'is invalid if area code length is not two' do
        FactoryGirl.build(:company, area_code: 133).should_not be_valid
    end
    
    it 'is invalid if telephone number length is not eight' do
        FactoryGirl.build(:company, phone_number: 131313).should_not be_valid
    end
    
    it 'should have a valid site' do
        FactoryGirl.build(:company, site: "www.paodemel.com.br").should be_valid
    end
    # métodos de instância
    it "return company's full name as a string" do
         FactoryGirl.build(:company, name: "Lindt").name.should == "Lindt"
    end
    
    it 'return cep as an integer' do
        FactoryGirl.build(:company, cep: 12345678).cep.should == "12345678"
    end
    
    it "return company's site as a string" do
         FactoryGirl.build(:company, site: "www.brigadeiro.com").site.should == "www.brigadeiro.com"
    end    

    #testing attributes
    it 'should set the name correctly' do
        expect(FactoryGirl.build(:company, name: "Kinder").name).to eq("Kinder")
    end
    
    it 'should set the address correctly' do
        expect(FactoryGirl.build(:company, address: "Rua do Cacau").address).to eq("Rua do Cacau")
    end

    it 'should set the cnpj correctly' do
        expect(FactoryGirl.build(:company, cnpj: 12345678910).cnpj).to eq("12345678910")
    end
    
    it 'should set the area code correctly' do
        expect(FactoryGirl.build(:company, area_code: 13).area_code).to eq("13")
    end
    
    it 'should set the phone number correctly' do
        expect(FactoryGirl.build(:company, phone_number: 12345678).phone_number).to eq("12345678")
    end    

    it 'should set the site correctly' do
        expect(FactoryGirl.build(:company, site: "www.doces.com").site).to eq("www.doces.com")
    end
    
  it 'should set the description correctly' do
    expect(FactoryGirl.create(:service, description:"Cursos de Klingon, Quenya e Sindarin").description).to eq("Cursos de Klingon, Quenya e Sindarin")
  end    
end
