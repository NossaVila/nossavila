# -*- coding: utf-8 -*-
alessandro = User.create!(:first_name => 'Alessandro', :last_name => 'Gusmao', :username => 'alelalala', :password => 'casteliaso', :address => 'Rua Alpinos', :cep => '04348120', :cpf => '85532937001', :email => 'aletrutk@hotmail.com')
marcia = User.create!(:first_name => 'Marcia', :last_name => 'Ribeiro', :username => 'oleolas', :password => 'casteliaso', :address => 'Rua das Jabuticabas', :cep => '04348120', :cpf => '86166152108', :email => 'marciaulk@hotmail.com')
ariel = User.create!(:first_name => 'Ariel', :last_name => 'Tales', :username => 'alelola', :password => 'casteliaso', :address => 'Rua Jose Moraes', :cep => '04348120', :cpf => '09226751714', :email => 'pequenose@hotmail.com')
andersvaldo = User.create!(:first_name => 'Andersvaldo', :last_name => 'Faria', :username => 'aloelalala', :password => 'casteliaso', :address => 'Rua dos Guapares', :cep => '04348120', :cpf => '86777640207', :email => 'cilinaldok@hotmail.com')
root = Category.create!({:name => "root"})
edu = Category.create!({:name => "educação", :supercategory => root})
edup = Category.create!({:name => "Educação Privada", :supercategory => edu})
categories = [{:name => "Educação Pública", :supercategory => edu}, {:name => "lazer", :supercategory => root}]
cons = Category.create!({:name => "Construção Civil", :supercategory => root})
doms = Category.create!({:name => "Doméstico", :supercategory => root})
logs = Category.create!({:name => "Logística", :supercategory => root})
trps = Category.create!({:name => "Transporte", :supercategory => root})
Category.create!({:name => "Alimentação", :supercategory => root})
Category.create!({:name => "Comércio", :supercategory => root})
Category.create!({:name => "Entretenimento", :supercategory => root})

pintor = Service.create!(:title => 'Pintor - Disponível 7 dias por semana', 
            :description => 'Dez anos de experienca, faço qualquer textura de parede e até aceito desafios.', 
            :address => 'Rua Amor 323',
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => alessandro)

jardineiro = Service.create!(:title => 'Jardinaria - Especialista em formas de animais', 
            :description => 'Tenha suas plantas cuidadas pelo jardineiro que deu forma ao jardim do rei Trevis II.', 
            :address => 'Rua Medo 323',
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => alessandro)

prof = Service.create!(:title => 'Aulas particulares de Latim', 
            :description => 'Finalmente descubra o que significa "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua".', 
            :address => 'Rua Vida 323',
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => ariel)

pedr = Service.create!(:title => 'Pedreira Artistica', 
            :description => 'Realizo servicos de construcao civil que demandem mais cuidado e detalhe.', 
            :address => 'Rua Queijo 323',
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => marcia)

moto = Service.create!(:title => 'Disponivel aos fins de semana para fazer entregas', 
            :description => 'Entrego qualquer coisa que possa ser carregada em uma moto na regiao, realizo entregas de artigos maiores tambem dependendo da situacao.', 
            :address => 'Rua do matão 323',
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => andersvaldo)
            
doceria = Company.create!(:name => "Doceria", :description => "Melhores doces da região. Venha conferir!", :address => "Rua do Amor, nº13", 
                :cep => "093514800", :cnpj => "39.436.146/0001-10", :phone_number => "13131313", :area_code => "23", :site => "bemcasado.com.br",
                :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => ariel)

root.services << pintor         
cons.services << pintor
root.services << pedr
cons.services << pedr
root.services << prof
edu.services << prof
edup.services << prof
root.services << moto
logs.services << moto
root.companies << doceria
doms.companies << doceria


categories.each do |category|
    Category.create!(category)
end

