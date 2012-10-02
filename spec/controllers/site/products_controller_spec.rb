require 'spec_helper'

def show(product = Factory.create(:product), options = {})
  get :show, {:type => product.type.slug, :product => product.slug}.merge(options)
  product
end

describe Site::ProductsController do

  describe "GET 'index'" do
    before do
      3.times { Factory.create(:product) }
    end
    
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    it "assigns @products" do
      get :index
      assigns(:products).should_not be_nil 
    end
    
    it "lists only enabled products" do
      Product.should_receive(:enabled)
      get :index
    end
    
  end

  describe "GET 'show'" do
    it "returns http success" do
      show(Factory.build(:product))
      response.should be_success
    end
  end

end
