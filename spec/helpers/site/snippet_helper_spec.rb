require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the Site::SnippetHelper. For example:
#
# describe Site::SnippetHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe Site::SnippetHelper do
  it "gets snippet by slug" do
    Snippet.should_receive(:find_by_slug).with('slug')
    helper.snippet('slug')
  end
end
