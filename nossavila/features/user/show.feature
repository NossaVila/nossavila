Feature: User Dashboard

  In order to be able to see my activity
  As an user
  I want to see my services and my information
  
  Background: Create Services
    Given the following categories exist:
      |name            |
      |Educação Privada|

    
    Given the following users exist:
    |first_name |last_name |cep       |address      |cpf         |email             |password      |password_confirmation |
    |Armando    |Vader     |05508-090 |Rua do Matão |56328230320 |armando@gmail.com |armando1234   |armando1234           |
    |Ludison    |Solo      |15508-090 |Rua de Matão |52346200859 |ardssdm@gmail.com |armando1234   |armando1234           |
    
  
    Given the following services exist:
    |title               | description |
    |Brigadeiros Gourmet | Ganhei o Masterchief Junior quando crianca |
    |Aulas de Judo       | Muitas aulas, sou faixa coral. Treino desde pequeno |
    
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
    And I should see "armando@gmail.com"

  Scenario: Adding additional information
    Given I am on the user dashboard page for "Armando"
    And I should see "Adicionar Informação"
    Then I click "Adicionar Informação"
    Then I fill in "additional_information_title" with "Telefone"
    And I fill in "additional_information_information" with "5555555"
    Then I press "Adicionar"
    Then I should see "Telefone:"
    And I should see "5555555"
    
  Scenario: Accessing User profile through a link in his service
    Given I am not a logged in user
    Then I am on the log in page
    And I fill in "user_email" with "armando@gmail.com"
    And I fill in "user_password" with "ardssdm@gmail.com"
    Then I press "Login"
    Given I am on the services page
    Then I should see "Pintor"
    Then I follow "Armando"
    Then I should see "armando@gmail.com"
    And I should see "Vader"
    And I should not see "Adicionar Informação"