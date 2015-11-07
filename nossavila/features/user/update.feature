Feature: Update user information

    In order to keep my information up-to-date
    As a user
    I want to edit my personal information and see it updated
    
    Background: I am a logged in user
      Given I am a logged in user
      And I am on the update user page
    
    Scenario: with valid arguments
      Given I fill in "user_first_name" with "Armando"
      And I fill in "user_cpf" with "36909492897"
      And I fill in "user_current_password" with "armando1234"
      And I press "Atualizar"
      Then I should see " A sua conta foi atualizada com sucesso"
      