# /spec/models/service_spec.rb

require 'spec_helper'

describe Service, :pending => true do
  it "is invalid without a title" do
    Factory.build(:service, title: nil).should_not be_valid
  end
  it "is invalid without a description" do
    Factory.build(:service, description: nil).should_not be_valid
  end
  
  # validação de tags/categorias?
  it "should set the title correctly" do 
    expect(Factory.create(:service, title: "pintor-atendo a domicilio").title).to eq("pintor-atendo a domicilio")  
  end 
  it "should set the description correctly" do
    expect(Factory.create(:service, description:"Tenha sua casa pintada por um renomado pintor do Jabaquara.").description).to eq("Tenha sua casa pintada por um renomado pintor do Jabaquara.")
  end
  
end
 