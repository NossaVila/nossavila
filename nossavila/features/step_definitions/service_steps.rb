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
    root = Category.create!({:name => "root"})
    categories_table.hashes.each do |category|
    Category.create(category)
    end
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

Then(/it should raise an error$/) do
    expect{page}.to raise_exception(/A validação falhou/)
end