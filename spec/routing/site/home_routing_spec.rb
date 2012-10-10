require "spec_helper"

describe Site::HomeController, "routing" do
  it "should route to #index" do
    {:get => "/"}.should route_to("site/home#index")
  end
end
