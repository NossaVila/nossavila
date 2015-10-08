# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ginueapig = User.create!(:first_name => 'John', :last_name => 'Titor', :username => 'lolaass', :password => 'casteliasa', :address => 'sorocaba', :cep => '04348120', :cpf => '42944702831',
            :email => 'kuddddl@hotmail.com')
services = [{:title => 'Pintor - Atendo a domicilio', 
            :description => 'Tenha sua casa pintada por um renomado pintor do Jabaquara, da melhor e mais renomada classe de pintores. E voce nem precisa sair da sua casa', 
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => ginueapig},
            {:title => 'Pintor - Atendo a domicilio', 
            :description => 'Tenha sua casa pintada por um renomado pintor do Jabaquara, da melhor e mais renomada classe de pintores. E voce nem precisa sair da sua casa', 
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => ginueapig},
            {:title => 'Pintor - Atendo a domicilio', 
            :description => 'Tenha sua casa pintada por um renomado pintor do Jabaquara, da melhor e mais renomada classe de pintores. E voce nem precisa sair da sua casa', 
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => ginueapig}]
            
            
services.each do |service|
    Service.create!(service)
end
