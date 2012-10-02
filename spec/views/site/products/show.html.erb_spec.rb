require 'spec_helper'

describe "site/products/show.html.erb" do
  before(:each) do
    assign(:product, Factory.build(:product))
  end
  
  it "should be success" do
    render
  end
end
