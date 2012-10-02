require 'spec_helper'

describe Site::StaticHelper do
  describe "#static" do
    context "with param 'the-page'" do
      it "should be /the-page.html" do
        helper.static('the-page').should eq('the-page.html')
      end
    end
  end
end
