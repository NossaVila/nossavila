Feature: register a company
  
  In order to list companies
  As an area resident
  I want to register local companies and their information
  
  Background: Create a category
    Given the following categories exist:
      |name            |
      |Educação Privada|
  
    Given root has subcategory "Educação Privada"
    Given I am a logged in user
    And I am on the companies page
    Then I should see "Criar Estabelecimento"
    And I follow "Criar Estabelecimento" 
    When I fill in "company_name" with "Escola Austen"
    And I fill in "company_description" with "Colégio interno para garotas"
    And I fill in "company_address" with "Rua Chawton, 13"
    And I fill in "company_cep" with "05508-090"
    And I fill in "company_cnpj" with "36909492897"
    And I fill in "company_area_code" with "11"
    And I fill in "company_phone_number" with "12345678"
    And I fill in "company_site" with "www.escolaausten.com"
    And I check "Educação Privada" category
    And I press "Criar" 
    Then I should see "Novo estabelecimento criado com sucesso"
    And I should see "Escola Austen"
    And I should see "Colégio interno para garotas" 
    And I should see "Rua Chawton, 13"

  Scenario: I am not a logged user and I try to create a new service
    Given I am not a logged in user
    And I am on the companies page
    And I follow "Criar Estabelecimento"
    Then I should see "É necessário estar logado para registrar um estabelecimento"
    And I should be redirected to the user sign in page
    
  Scenario: I am a logged in user and I enter with invalid fields
    Given I am a logged in user
    And I am on the companies page
    And I follow "Criar Estabelecimento"
    When I fill in "company_name" with ""
    And I press "Criar"
    And I should see "Falha ao criar estabelecimento"
    And I should be redirected to the new company page