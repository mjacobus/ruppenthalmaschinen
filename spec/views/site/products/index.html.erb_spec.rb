require 'spec_helper'


describe "site/products/index.html.erb" do
  before do
    @product = Factory.create(:product);
    assign(:products, Product.enabled.page(1))
    render
  end
  
  it "should be success" do
  end
  
  
  it "should have link to the product page" do
    assert_select 'a', :href => product_path(@product)
  end
end
