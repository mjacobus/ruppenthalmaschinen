require "spec_helper"

describe Site::ServicesController, "routing" do
  
  it "should route to #index" do
    {:get => "/servicos"}.should route_to("site/services#index")
  end
  
  it "should route to #index?page=5" do
    {:get => "/servicos/5"}.should route_to("site/services#index",
      :page => '5')
  end
  
  it "should route to #show" do
    {:get => "/servicos/service-title"}.should route_to(
      "site/services#show",
      :service => 'service-title'
    )
  end
  
end
