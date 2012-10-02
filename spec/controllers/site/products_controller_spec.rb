require 'spec_helper'

def show(product = Factory.create(:product), options = {})
  get :show, {:type => product.type.slug, :product => product.slug}.merge(options)
  product
end

describe Site::ProductsController do

  describe "GET 'index'" do
    before do
      2.times { Factory.create(:product, :enabled => true) }
      Factory.create(:product, :enabled => false)
    end
    
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    it "assigns enabled products to @products" do
      get :index
      assigns(:products).should =~ Product.enabled
    end
    
    it "should paginate" do
      q = stub("query")
      Product.stub(:enabled).and_return(q)
      q.should_receive(:page).with('2').and_return(q)
      q.should_receive(:per).and_return(q)
      get :index, :page => '2'
    end
    
  end

  describe "GET 'show'" do
    it "returns http success" do
      show(Factory.build(:product))
      response.should be_success
    end
  end

end
