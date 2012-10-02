require 'spec_helper'


describe "site/products/index.html.erb" do
  before(:each) do
    @product = Factory.create(:product);
    assign(:products, Product.enabled.page(1))
  end
  
  it "should be success" do
    render
  end
  
  
  it "should have link to the product page" do
    render
    assert_select 'a', :href => product_path(@product)
  end
end
