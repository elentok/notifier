require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe HomeHelper do
  describe "#nav_link_to" do
    it "creates a normal link" do
      html = helper.nav_link_to("bla", "title", "icon")
      html.should == %{<li><a href="bla"><i class="icon-icon"></i><span>title</span></a></li>}
    end
    it "creates an active link when within the target page" do
      fake_url = '/fake/url'
      helper.stub(:url_for).and_return(fake_url)
      html = helper.nav_link_to(fake_url, "title", "icon")
      html.should == %{<li class="active"><a href="#{fake_url}"><i class="icon-icon icon-white"></i><span>title</span></a></li>}
    end
  end
end
