# service steps

# when I fill implementado em common_steps

Given(/the following services exist:/) do |services_table|
    services_table.hashes.each do |service|
    Service.create(service)
    end
end

When(/^I check "(.*?)"/) do |field|
    check(field)
end

When(/^I should be redirected to the (.+) page$/) do |url|
    expect(response).to redirect_to(url)
end

