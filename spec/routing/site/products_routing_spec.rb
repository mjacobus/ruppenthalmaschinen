require "spec_helper"

describe Site::ProductsController, "routing" do
  
  
  it "should route to #index" do
    {:get => "/produtos"}.should route_to("site/products#index")
  end
  
  it "should route to #index?page=5" do
    {:get => "/produtos/5"}.should route_to("site/products#index",
      :page => '5')
  end
  
  it "should route to #index" do
    {:get => "/produtos/automotivo"}.should route_to("site/products#index",
      :category => 'automotivo')
  end
  
  it "should route to #index {:page => '5'}" do
    {:get => "/produtos/automotivo/5"}.should route_to("site/products#index",
      :category => 'automotivo',
      :page => '5')
  end
  
  it "should route to #show" do
    {:get => "/produtos/automotivo/maquina-de-chinfrar"}.should route_to(
      "site/products#show",
      :category => 'automotivo',
      :product => 'maquina-de-chinfrar'
    )
  end
  
end
