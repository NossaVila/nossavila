#World(Devise::TestHelpers)

When(/^I fill in "(.*?)" field with "(.*)"$/) do |label, value|
  fill_in label, with: value
end

When(/^I press the "(.*?)" button$/) do |caption|
  click_button caption
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

    
Then(/^I should not see "(.*?)"$/) do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Given(/^(?:|I )am on the (.+)$/) do |page_name|
  visit path_to(page_name.downcase)
end

When(/^(?:|I )go to (.+)$/) do |page_name|
  visit path_to(page_name)
end