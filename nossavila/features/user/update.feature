Feature: Update user information

    In order to keep my information up-to-date
    As a user
    I want to edit my personal information and see it updated
    
    Background: I am a logged user
      Given I am a logged user
      And I am on the /users/edit page
    
    Scenario: with valid arguments
      Given I fill in "Nome" with "Armando"
      And I fill in "CPF" with "36909492897"
      And I fill in "Confirmação de senha" with #"senha"
      Then I should see "Armando"
      And I should see "36909492897"
      