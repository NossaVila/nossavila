When(/^(?:|I )check "([^"]*)" category$/) do |field|
    if field == "Educação Privada" then
        check("company_categories_educao_privada")
    else
        check(field)
    end
end
