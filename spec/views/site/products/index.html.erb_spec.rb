require 'spec_helper'


describe "site/products/index.html.erb" do
  before(:each) do
    @p1 = Factory.build(:product);
    @p2 = Factory.build(:product);
    assign(:products, [@p1,@p2])
  end
  
  it "should be success" do
    render
  end
  
  
  it "should have link to the product page" do
    render
    assert_select 'a', :href => product_path(@p1)
  end
end
