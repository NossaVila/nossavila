Feature: Filter the Services list by category
  As a person interesting in searching for a service in a category
  So that I can quickly find the service
  I want to see services that match only the specific categories
  
  
Background: Services have been added to the database
    
  Given the following categories exist:
  |name            |
  |Educação        |
  |Educação Pública|
  |Educação Privada|
  |Construção Civil|
  
  Given root has subcategory "Educação"
  Given root has subcategory "Construção Civil"
  Given that "Educação Privada" is a subcategory of "Educação"
  And that "Educação Pública" is a subcategory of "Educação"
  Given I am a logged in user 
  Given I am on the Criar novo serviço page
  When I fill in "service_title" with "Pintor"
  And I fill in "service_description" with "Dez anos de experiencia, faço qualquer textura de parede"
  And I check the "Construção Civil" category
  And I press "Criar" 
  Given I am on the Criar novo serviço page
  When I fill in "service_title" with "Aulas particulares de latim"
  And I fill in "service_description" with "Descubra o significado das frases que você sempre quis" 
  And I check the "Educação Privada" category
  And I press "Criar" 
  Given I am on the Criar novo serviço page
  When I fill in "service_title" with "Predeira Artística"
  And I fill in "service_description" with "Trabalhos da construção civil que demandam mais cuidado"
  And I check the "Construção Civil" category
  And I press "Criar" 
  Given I am on the Criar novo serviço page
  When I fill in "service_title" with "Fotógrafo"
  And I fill in "service_description" with "Fotos Artísticas e Profissionais"
  And I check the "Educação Pública" category
  And I press "Criar"  
  Given I am on the Criar novo serviço page
  When I fill in "service_title" with "Aulas de Matemática"
  And I fill in "service_description" with "Aulas de matemática básica para alunos de Ensino Médio" 
  And I check the "Educação Privada" category
  And I press "Criar" 

  And I am on the NossaVilla home page
  
Scenario: filter the services list by category
  Given I am on the services page
  When I check the "Construção Civil" category
  And I press "Buscar"
  Then I should see "Pintor"
  And I should see "Predeira Artística"
  And I should not see "Fotográfo"
  And I should not see "Aulas particulares de latim"
  And I should not see "Aulas de Matemática"
  When I click "educaotriangle"
  And I should see "Educação Pública"
  And I check "Educação Privada"
  Then I should see "Aulas particulares de latim"
  And I should see "Aulas de Matemática"
  And I should not see "Pintor"
  And I should not see "Fotógrafo"
  And I should not see "Pedreira Artística"
  When I follow "Educação Pública"
  Then I should see "Fotógrafo"
  And I should not see "Pintor"
  And I should not see "Aulas particulares de latim"
  And I should not see "Aulas de Matemática"
  And I should not see "Pedreira Artística"