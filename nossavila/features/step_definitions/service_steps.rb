# -*- coding: utf-8 -*-
# service steps

# when I fill implementado em common_steps

Given(/the following services exist:/) do |services_table|
    services_table.hashes.each do |service|
    Service.create(service)
    end
end

# When(/^I should be redirected to the (.+) page$/) do |url|
#     expect(response).to redirect_to(url)
# end

Given(/^the following categories exist:$/) do |categories_table|
    root = Category.find_by(:name => "root")
    if root.nil?
      root = Category.create!({:name => "root"})
    end
    categories_table.hashes.each do |category|
      cat = Category.create(category)
    
    end
end

Given(/^root has subcategory "([^"]*)"$/) do |subcategory|
  root = Category.find_by(:name => "root")
    if root.nil?
      root = Category.create!({:name => "root"})
    end
  subcat = Category.find_by(:name => subcategory) 
  root.subcategories << subcat
  subcat.supercategory = root
end

Given(/^that "([^"]*)" is a subcategory of "([^"]*)"$/) do |subcat, cat|
  category = Category.find_by(:name => cat)
  subcategory = Category.find_by(:name => subcat)
  category.subcategories << subcategory
  subcategory.supercategory = category
end

When(/^(?:|I )check the "([^"]*)" category$/) do |field|
    if field == "Construção Civil" then
        check("service_categories_construo_civil")
    elsif field == "Educação Pública" then
        check("service_categories_educao_pblica")
    elsif field == "Educação Privada"
        check("service_categories_educao_privada")
    else
        check(field)
    end
end

When(/^(?:|I )check the "([^"]*)" category in the navigation bar$/) do |field|
  if field == "Construção Civil" then
        within('table') do
          within('tbody') do
            check("service_categories_construo_civil")
          end
        end
    elsif field == "Educação Pública" then
        check("service_categories_educao_pblica")
    elsif field == "Educação Privada"
        check("service_categories_educao_privada")
    else
        check(field)
    end
end

Then(/it should raise an error$/) do
    expect{page}.to raise_exception(/A validação falhou/)
end
