require 'spec_helper'

describe "messages/show" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :sender => nil,
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
