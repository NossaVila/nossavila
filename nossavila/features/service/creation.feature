Feature: Create services
  
  As I have a service to offer
  So that I can advertise it
  I want to see it added to the services list
  
  Scenario: I am a logged in user and I add 'Aulas de canto' service
    Given I am a logged in user
    When I fill in "title" with "Aulas de canto"
    And I fill in "description" with "Aprenda a cantar. Primeira aula gratuita"
    And I check "Educação" in the categories
    And I press the "criar" button
    Then I should see "Novo serviço criado com sucesso"
    And I should see "Aulas de canto"
    And I should see "Aprenda a cantar. Primeira aula gratuita" 
    
  Scenario: I am not a logged user and I try to create a new service
    Given I am on the NossaVilla home page
    When I press the "Criar novo Serviço" button
    Then I should see "É necessário estar logado para criar um serviço"
    And I should be redirected to the users/sign_in page
    