require 'spec_helper'

describe "Messages" do
  describe "GET /messages" do
    it "works! (now write some real specs)" do
      pending('fix this somehow')
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      sign_in Fabricate(:user)
      get messages_path
      response.status.should be(200)
    end
  end
end
