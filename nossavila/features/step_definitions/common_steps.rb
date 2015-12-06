World(Devise::TestHelpers)
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |label, value|
   fill_in label, with: value
end
 
When(/^(?:|I )press "([^"]*)"$/) do |button|
  click_button(button)
end

When(/^(?:|I )click "([^"]*)"$/) do |link|
  page.find("#{link}").click
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

    
Then(/^I should not see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    expect(page).to have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When(/^(?:|I )go to "([^"]*)"$/) do |page_name|
  visit path_to(page_name)
end

When(/^(?:|I )check "([^"]*)"$/) do |field|
  check(field)
end

When(/^I should be redirected to (.+)$/) do |page_name|
    visit path_to(page_name)
end
