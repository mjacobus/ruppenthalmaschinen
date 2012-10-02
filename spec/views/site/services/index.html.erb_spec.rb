require 'spec_helper'

describe "site/services/index.html.erb" do
  before do
    @service = Factory.create(:service);
    assign(:services, Service.enabled.page(1))
    render
  end
  
  it "should be success" do
  end
  
  
  it "should have link to the service page" do
    assert_select 'a', :href => service_path(@service)
  end
end
