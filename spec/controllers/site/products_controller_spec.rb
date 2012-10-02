require 'spec_helper'

describe Site::ProductsController do
  
  def show(product = Factory.create(:product), options = {})
    get :show, {:type => product.type.slug, :product => product.slug}.merge(options)
    product
  end

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
    before { @product = Factory.create(:product) }
    
    it "returns http success" do
      show(@product)
      response.should be_success
    end
    
    it "should assign @product" do
      show(@product)
      assigns(:product).should eq(@product)
    end
    
    it "shows only enabled" do
      q = stub("query")
      Product.should_receive(:enabled).and_return(q)
      q.should_receive(:find_by_slug).with(@product.slug).and_return(q)
      show(@product)
    end
    
    it "raises error when @service is nil" do
      @product.enabled = false;
      @product.save!
      lambda { show(@product) }.should raise_error
    end
  end

end
