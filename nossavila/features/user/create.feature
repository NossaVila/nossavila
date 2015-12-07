Feature: Create a new account
  
  In order to sign up
  As a user
  I want to create a new account
  Background: I am on the sign up page
    Given I am on the new user page
    Given the following categories exist:
      |name            |
      |Educação Privada|
  
  
  Scenario: I am at the sign up page
    When I fill in "user_first_name" with "Armando"
    And I fill in "user_last_name" with "Vader"
    And I fill in "user_cep" with "05508-090"
    And I fill in "user_address" with "Rua do Matão"
    And I fill in "user_cpf" with "36909492897"
    And I fill in "user_email" with "armando@gmail.com"
    And I fill in "user_password" with "armando1234"
    And I fill in "user_password_confirmation" with "armando1234"
    Then I press "Registrar-se" 
    Then I should see "Bem vindo! Você realizou seu registro com sucesso."
  
  Scenario: I am on the sign up page and I fill in some field with invalid data
    When I fill in "user_first_name" with "Armando"
    And I fill in "user_last_name" with "Vader"
    And I fill in "user_cep" with "05508-090"
    And I fill in "user_address" with "Rua do Matão"
    And I fill in "user_email" with "armando@gmail.com"
    And I fill in "user_password" with "armando1234"
    And I fill in "user_password_confirmation" with "armando1234"
    Then I press "Registrar-se" 
    And I should see "Cpf não pode ficar em branco"
    And I should be redirected to the new user page