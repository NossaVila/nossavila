Feature: Filter the Services list by category
  As a person interesting in searching for a service in a category
  So that I can quickly find the service
  I want to see services that match only the specific categories
  
Background: Services have been added to the database
  
  Given the following services exist:
  | title                       | description                                            |category        |
  | Pintor                      |Dez anos de experiencia, faço qualquer textura de parede|Construção Civil|
  | Aulas particulares de latim |Descubra o significado das frases que vocẽ sempre quis  |Educação Privada|
  | Predeira Artística          |Trabalhos da construção civil que demandam mais cuidado |Construção Civil|
  | Fotográfo                   |Fotos Artísticas e Profissionais                        |Educação Pública|
  | Aulas de Matemática         |Aulas de matemática básica para alunos de Ensino Médio  |Educação Privada|
 
  And I am on the NossaVilla home page
  
Scenario: filter the services list by category
  When I press the "Construção Civil" button
  Then I should see "Pintor"
  And I should see "Predeira Artística"
  And I should not see "Fotográfo"
  And I should not see "Aulas particulares de latim"
  And I should not see "Aulas de Matemática"
  When I press the "Educação Privada" button
  Then I should see "Aulas particulares de latim"
  And I should see "Aulas de Matemática"
  And I should not see "Pintor"
  And I should not see "Fotógrafo"
  And I should not see "Pedreira Artística"
  When I press the "Educação Pública" button
  Then I should see "Fotógrafo"
  And I should not see "Pintor"
  And I should not see "Aulas particulares de latim"
  And I should not see "Aulas de Matemática"
  And I should not see "Pedreira Artística"