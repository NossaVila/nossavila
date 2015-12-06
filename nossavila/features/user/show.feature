Feature: User Dashboard

  In order to be able to see my activity
  As an user
  I want to see my services and my information
  
  Background: Create Services
    Given the following categories exist:
      |name            |
      |Educação Privada|

    Given the following services exist:
    |title               |
    |Aulas de Judo       |
    |Brigadeiros Gourmet |
    
    Given the following users exist:
    |first_name |last_name |cep       |address      |cpf         |email             |password      |password_confirmation |
    |Armando    |Vader     |05508-090 |Rua do Matão |56328230320 |armando@gmail.com |armando1234   |armando1234           |
    |Ludison    |Solo      |15508-090 |Rua de Matão |56328230320 |ardssdm@gmail.com |armando1234   |armando1234           |
    
    Given I am on the log in page
    And I fill in "user_email" with "armando@gmail.com"
    And I fill in "user_password" with "armando1234"
    Then I press "Login"

  Scenario: I create some services and then I want to see them on my Dashboard
    Given I am on the Criar novo serviço page
    When I fill in "service_title" with "Pintor"
    And I fill in "service_description" with "Dez anos de experiencia, faço qualquer textura de parede"
    And I press "Criar" 
    Given I am on the Criar novo serviço page
    When I fill in "service_title" with "Aulas particulares de latim"
    And I fill in "service_description" with "Descubra o significado das frases que você sempre quis" 
    And I check the "Educação Privada" category
    And I press "Criar"
    Given I am on the user dashboard page for "Armando"
    Then I should see "Pintor"
    And I should see "Aulas particulares de latim"
    And I should not see "Aulas de Judo"
    And I should not see "Brigadeiros Gourmet"

  Scenario: Seeing my information in my Dashboard
    Given I am on the user dashboard page for "Armando"
    Then I should see "Armando"
    And I should see "Vader"
    And I should see "05508-090"
    And I should see "armando@gmail.com"