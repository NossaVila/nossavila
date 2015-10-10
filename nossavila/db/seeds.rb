# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ginueapig = User.create!(:first_name => 'James', :last_name => 'Titor', :username => 'ltlassv', :password => 'casteliaso', :address => 'sorocaba', :cep => '04348120', :cpf => '85532937001',
            :email => 'tudddrl@hotmail.com')
root = Category.create!({:name => "root"})
category1 = Category.create!({:name => "educação", :supercategory => root})
category2 = Category.create!({:name => "educaçao-privada", :supercategory => category1})
categories = [{:name => "educaçao-pública", :supercategory => category1}, {:name => "lazer", :supercategory => root}]
services = [{:title => 'Pintor - Atendo a domicilio', 
            :description => 'Tenha sua casa pintada por um renomado pintor do Jabaquara, da melhor e mais renomada classe de pintores. E voce nem precisa sair da sua casa', 
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => ginueapig},
            {:title => 'Aulas particulares de Álgebra Booleana', 
            :description => 'Sou o Junior Fronteira, tenho doutorado na UNIP e dou aulas particulares de flop-flips KJ, D-1.', 
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => ginueapig},
            {:title => 'Artesanato', 
            :description => 'Faço artesanato por encomenda, todos os tipos.', 
            :created_at => Date.new(1822, 01, 01), :updated_at => Date.new(1822, 01, 01), :user => ginueapig}]
            

categories.each do |category|
    Category.create!(category)
end

services.each do |service|
    ser = Service.create!(service)
    category1.services << ser
    category2.services << ser
end


