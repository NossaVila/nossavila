Feature: User Dashboard

  In order to be able to see my activity
  As an user
  I want to see my services and my information
  
  Background: Create Services
    Given the following categories exist:
      |name            |
      |Educação Privada|
      |Construção Civil|
  
    Given root has subcategory "Construção Civil"
    And root has subcategory "Educação Privada"
    
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
    Then I should see "Login efetuado com sucesso."
    
    Given I am on the Criar novo serviço page
    When I fill in "service_title" with "Pintor"
    And I fill in "service_description" with "Dez anos de experiencia, faço qualquer textura de parede"
    And I fill in "service_address" with "Rua da Saudade"
    And I check the "Construção Civil" category
    And I press "Criar"
    Then I should see "Novo serviço criado com sucesso"
    And I should see "Armando"
    Given I am on the Criar novo serviço page
    When I fill in "service_title" with "Aulas particulares de latim"
    And I fill in "service_description" with "Descubra o significado das frases que você sempre quis"
    And I fill in "service_address" with "Rua da Solidão"
    And I check the "Educação Privada" category
    And I press "Criar"   
 
    

  Scenario: I created some services and then I want to see them on my Dashboard
    
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
    Given I am on the NossaVilla home page
    And I follow "Perfil"
    And I should see "Adicionar Informação"
    Then I click "Adicionar Informação"
    Then I fill in "additional_information_title" with "Telefone"
    And I fill in "additional_information_information" with "5555555"
    Then I should see "Adicionar"
    Then I press "Adicionar"
    Then I should see "Telefone:"
    And I should see "5555555"
    
  Scenario: Accessing User profile through a link in his service
    Given I am not a logged in user
    And I am on the services page
    Then I should see "Pintor"
    Then I follow "Armando"
    And I should see "Armando"
    And I should see "Vader"
    And I should not see "Adicionar Informação"
    And I should see "armando@gmail.com"