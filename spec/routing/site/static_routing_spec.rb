require "spec_helper"

describe Site::StaticController, "routing" do
  describe "everything should route to #index" do
    specify do
      {:get => "/about.html"}.should route_to("site/static#index", :page => 'about')
    end
    
    specify do
      {:get => "/faq.html"}.should route_to("site/static#index", :page => 'faq')
    end
  end  
end
