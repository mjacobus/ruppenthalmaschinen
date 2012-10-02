require 'spec_helper'

describe Site::ServicesController do
  
  def show(service = Factory.build(:product), options = {})
    get :show, {:service => service.slug}.merge(options)
  end

  describe "GET 'index'" do
    before do
      2.times { Factory.create(:service, :enabled => true) }
      Factory.create(:service, :enabled => false)
    end
    
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    it "should assign enabled services to @services" do
      get :index
      assigns(:services).should =~ Service.enabled
    end
    
    it "should paginate" do
      q = stub("query")
      Service.stub(:enabled).and_return(q)
      q.should_receive(:page).with('2').and_return(q)
      q.should_receive(:per).and_return(q)
      get :index, :page => '2'
    end
  end

  describe "GET 'show'" do
    before { @service = Factory(:service) }
    
    it "returns http success" do
      show(@service)
      response.should be_success
    end
    
    it "should assign @service" do
      show(@service)
      assigns(:service).should eq(@service)
    end
    
    it "shows only enabled" do
      q = stub("query")
      Service.should_receive(:enabled).and_return(q)
      q.should_receive(:find_by_slug).with(@service.slug).and_return(q)
      show(@service)
    end
    
    it "raises error when @service is nil" do
      @service.enabled = false;
      @service.save!
      lambda { show(@service) }.should raise_error
    end
  end

end
