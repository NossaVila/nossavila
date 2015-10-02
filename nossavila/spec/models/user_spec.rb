# /spec/models/user_spec.rb

require 'spec_helper'

describe User, :pending => true do
    it "is invalid without a firstname"
    it "is invalid if firstname lenght is less than 2 characteres"
    it "is invalid without a lastname"
    it "is invalid if lastname lenght is greater than 30 characteres"
    it "is invalid without an adress"
    it "is invalid without a cep"
    it "is invalid if cep lenght is not eight"
    it "is invalid without an email"
    it "is invalid without a house number"
    it "is invalid without cpf number"
    it "should have a valid cpf number"
    it "return user's full name as a string"
    it "return cep as an integer"
    it "has a valid email"
end