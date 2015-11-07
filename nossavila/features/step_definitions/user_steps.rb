World(Devise::TestHelpers)

Given(/^I am not a logged in user$/) do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/users/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end

Given(/^I am a registered user$/) do
  email = 'armando@man.net'
  password = 'armando1234'
  first_name = "Armando"
  last_name = "Vader"
  cpf = "12345678910"
  address = "Rua do Matão"
  cep = "05508090"
  @user = User.create(:first_name => first_name, :last_name => last_name, :email => email, :cpf => cpf, :address => address, :cep => cep, :password => password, :password_confirmation => password)
end  

=begin   
  Given /^I am a registered user$/ do
    email = 'armando@man.net'
    password = 'armando1234'
    first_name = "Armando"
    last_name = "Vader"
    cpf = "12345678910"
    address = "Rua do Matão"
    cep = "05508090"
    @current_user = User.create(:first_name => first_name, :last_name => last_name, :email => email, :cpf => cpf, :address => address, :cep => cep, :password => password, :password_confirmation => password)
  
  end 
  # o que acha de given I am
  Given %{I go to the user sign in page}
  And %{I fill in "user_email" with "#{name}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Login"}
 
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Login"
=end  
Given(/^I am a logged in user$/) do
  email = 'testing@man.net'
  password = 'armando1234'
  first_name = "Armando"
  last_name = "Vader"
  cpf = "12345678910"
  address = "Rua do Matão"
  cep = "05508090"
  @current_user = User.create(:first_name => first_name, :last_name => last_name, :email => email, :cpf => cpf, :address => address, :cep => cep, :password => password, :password_confirmation => password)
  login_as(@current_user, :scope => :user)
end

Given(/^I am a logged in user with "([^"]*)" email and "([^"]*)" password$/) do |email, password|
  visit '/users/sign_in'
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button("Login")
end

Given(/^I log out$/) do
    logout
end
