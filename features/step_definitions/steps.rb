Given /^a guest user$/ do
end

When /^I visit the messages page$/ do
  visit messages_path
end

Then /^I am redirected to the login page$/ do
  page.current_path.should == new_user_session_path
end

Given /^a logged\-in user named "(.+)"$/ do |username|
  password = '123456'
  @logged_in_user = Fabricate(:user, username: username, password: password)
  visit new_user_session_path
  fill_in 'Username', with: username
  fill_in 'Password', with: password
  click_button 'Sign in'
  page.should have_content('Signed in successfully.')
end

Given /^a user named "(.+)"$/ do |username|
  @user = Fabricate :user, username: username
end

Given /^the following messages:$/ do |messages_table|
  create_messages_from_table(messages_table)
end

Then /^I see the following messages:$/ do |messages_table|
  actual = all('.message').map do |message|
    { 'title' => message.find('.title').text.strip }
  end

  actual.should == messages_table.hashes
end

Then /^I see (\d+) messages$/ do |messages_count|
  all('.message').should have(messages_count.to_i).messages
end

