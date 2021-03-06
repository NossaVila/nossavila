# -*- coding: utf-8 -*-
World(Devise::TestHelpers)

Given(/the following users exist:/) do |users_table|
    users_table.hashes.each do |user|
    User.create(user)
    end
end

Given(/^I am not a logged in user$/) do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/users/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end

Given(/^I am a logged in user$/) do
  email = 'testing@man.net'
  password = 'armando1234'
  first_name = "Armando"
  last_name = "Vader"
  cpf = "36909492897"
  address = "Rua do Matão"
  cep = "05508090"
  if User.find_by(:email => "testing@man.net").nil? then
    @current_user = User.create(:first_name => first_name, :last_name => last_name, :email => email, :cpf => cpf, :address => address, :cep => cep, :password => password, :password_confirmation => password)
    login_as(@current_user, :scope => :user)
  else
    @current_user = User.find_by(:email => "testing@man.net")
    login_as(@current_user, :scope => :user)
  end
end


Given(/^I log out$/) do
    logout
end
