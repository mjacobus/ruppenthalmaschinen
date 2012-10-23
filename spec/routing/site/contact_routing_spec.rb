require "spec_helper"

describe Site::ContactController, "routing" do
  it "should route to #new" do
    {:get => "/contato"}.should route_to("site/contact#new")
  end
  
  it "should route to #create" do
    {:post => "/contato"}.should route_to("site/contact#create")
  end
  
  it "should route to #create with format .js" do
    {:post => "/contato.js"}.should route_to("site/contact#create", format: 'js')
  end
end
