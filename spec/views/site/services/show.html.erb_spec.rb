require 'spec_helper'

describe "site/services/show.html.erb" do
  before do
    assign(:service, Factory.build(:service))
  end
  
  it "should be success" do
    render
  end
end
