require 'spec_helper'


describe Site::ProductsController, "#show" do
  def show(product = Factory.create(:product), options = {})
    get :show, {:category => product.category.slug, :product => product.slug}.merge(options)
    product
  end
  
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

describe Site::ProductsController, "#index" do
  before do
    @product = Factory.create(:product, :enabled => true)
    Factory.create(:product, :enabled => true)
    Factory.create(:product, :enabled => false)
  end
  
  describe " " do
    subject { response }
    before {get :index}
    its(:status) { should == 200 }
    it  { assigns(:products).should =~ Product.enabled }
  end
  
  describe "page 2" do
    it "should paginate" do
      q = stub("query")
      Product.stub(:enabled).and_return(q)
      q.should_receive(:page).with('2').and_return(q)
      q.should_receive(:per).and_return(q)
      get :index, :page => '2'
    end
  end

  describe "with type" do
    it "should query for specify type" do
      get :index, :category => @product.category.slug
      assigns(:products).should eq([@product])
    end
  end
end
