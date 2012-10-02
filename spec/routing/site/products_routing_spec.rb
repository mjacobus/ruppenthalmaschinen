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
    {:get => "/produtos/maquinas"}.should route_to("site/products#index",
      :type => 'maquinas')
  end
  
  it "should route to #index {:page => '5'}" do
    {:get => "/produtos/maquinas/5"}.should route_to("site/products#index",
      :type => 'maquinas',
      :page => '5')
  end
  
  it "should route to #show" do
    {:get => "/produtos/maquinas/maquina-de-chinfrar"}.should route_to(
      "site/products#show",
      :type => 'maquinas',
      :product => 'maquina-de-chinfrar'
    )
  end
  
end
