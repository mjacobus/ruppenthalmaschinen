require 'spec_helper'

describe Site::ProductsHelper do
  
  describe "#product_path" do
    it "gets the correct product path" do
      product = stub_model(Product,
                  :slug => 'product-name',
                  :category => stub_model(Category, :slug => 'type'))
      
      helper.product_path(product).should eq('/produtos/type/product-name')
    end
  end
  
end
