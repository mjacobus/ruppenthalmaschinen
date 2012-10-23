require 'spec_helper'

describe Site::HomeHelper do
  describe "#products" do
    it "should get home flagged products" do
      object = stub('return')
      Product.should_receive(:on_home_page).and_return(object)
      helper.home_products.should eq(object)
    end
  end
  
  describe "#services" do
    it "should get home flagged services" do
      object = stub('return')
      Service.should_receive(:on_home_page).and_return(object)
      helper.home_services.should eq(object)
    end
  end
end
