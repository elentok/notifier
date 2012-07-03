Given /^a guest user$/ do
end

When /^I visit the messages page$/ do
  visit messages_path
end

Then /^I am redirected to the login page$/ do
  page.current_path.should == new_user_session_path
end

Given /^a logged\-in user$/ do
  password = '123456'
  @user = Fabricate(:user, username: 'bob', password: password)
  visit new_user_session_path
  fill_in 'Username', with: @user.username
  fill_in 'Password', with: password
  find_field('Username').value.should == @user.username
  find_field('Password').value.should == password
  click_button 'Sign in'
  page.should have_content('Signed in successfully.')
end

Given /^the user has (\d+) messages$/ do |messages_count|
  @messages = []
  messages_count.to_i.times do
    @messages << Fabricate(:message, recipients: [@user])
  end
end

Given /^a message with no recipients$/ do
  Fabricate(:message)
end

Then /^I see (\d+) messages$/ do |messages_count|
  all('.message').should have(messages_count.to_i).items
end

