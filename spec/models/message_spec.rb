require 'spec_helper'

describe Message do
  describe "#to_user" do
    it "returns all of the message sent to a user" do
      user = User.create username: '456', 
        password: '123456', password_confirmation: '123456'
      message1 = Message.create
      message2 = Message.create
      message1.recipients << user

      Message.to_user(user.id).should == [message1]
    end
  end
end
