Given(/^I am logged in$/) do
  login_as 'dzmitry@shine.notepad.com'
end

Given(/^there is a turn with two people$/) do
  @turn = create :turn

  members = create_list :user, 2
  @turn.members << members
end

Given(/^I joined this turn this week$/) do
  @turn.members << current_user
end

When(/^I view the turns$/) do
  click_on 'Turns'
end

Then(/^I should see that my turn to be on duty will be in two weeks$/) do
  find('.duty:nth-child(3)').should have_content current_user.email
end
