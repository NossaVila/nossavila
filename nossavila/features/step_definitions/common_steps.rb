When(/^I fill the "(.*?)" field with "(.*?)"$/) do |label, value|
  fill_in label, with: value
end

When(/^I press the "(.*?)" button$/) do |caption|
  click_button caption
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end