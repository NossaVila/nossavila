# /spec/models/service_spec.rb

require 'spec_helper'

describe Service do
  it 'is invalid without a title' do
    FactoryGirl.build(:service, title: nil).should_not be_valid
  end
  it 'is invalid without a description' do
    FactoryGirl.build(:service, description: nil).should_not be_valid
  end
  
  it 'should set the title correctly' do 
    expect(FactoryGirl.create(:service, title: "pintor-atendo a domicilio").title).to eq("pintor-atendo a domicilio")  
  end 
  it 'should set the description correctly' do
    expect(FactoryGirl.create(:service, description:"Tenha sua casa pintada por um renomado pintor do Jabaquara.").description).to eq("Tenha sua casa pintada por um renomado pintor do Jabaquara.")
  end
  
end
 