Feature: Create services
  
  As I have a service to offer
  So that I can advertise it
  I want to see it added to the services list
  
  Background: Create a category
    Given the following categories exist:
      |name            |
      |Educação Privada|
    
  Scenario: I am a logged in user and I add 'Aulas de canto' service
    Given I am a logged in user
    And I am on the services page
    And I follow "Criar Serviço" 
    When I fill in "service_title" with "Aulas de canto"
    And I fill in "service_description" with "Aprenda a cantar. Primeira aula gratuita"
    And I fill in "service_address" with "Rua Sinatra, 13"
    And I check the "Educação Privada" category
    And I press "Criar" 
    Then I should see "Novo serviço criado com sucesso"
    And I should see "Aulas de canto"
    And I should see "Aprenda a cantar. Primeira aula gratuita" 
    
  Scenario: I am not a logged user and I try to create a new service
    Given I am on the Criar novo serviço page
    Then I should see "É necessário estar logado para criar um serviço"
    And I should be redirected to the user sign in page
    
  Scenario: I am a logged in user and I enter with invalid fields
    Given I am a logged in user
    And I am on the Criar novo serviço page
    When I fill in "service_title" with ""
    And I press "Criar"
    And I should see "Falha ao criar serviço"
    And I should be redirected to the Criar novo serviço page