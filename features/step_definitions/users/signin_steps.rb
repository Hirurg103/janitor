Given(/^there is my account in the system$/) do
  @user = create :user, password: 'password'
end

Given(/^I navigate to the home page$/) do
  visit '/'
end

When(/^I click Sign in$/) do
  click_link 'Sign in'
end

When(/^I enter my creadentials$/) do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'password'

  click_button 'Sign in'
end

Then(/^I should be logged in successfully$/) do
  expect(page).to have_content @user.email
end
