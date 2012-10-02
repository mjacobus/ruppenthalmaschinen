require 'spec_helper'

describe Site::ServicesHelper do
  describe "#service_path" do
    it "should get the correct service path" do
      service = stub_model(Service, :slug => "service-slug")
      helper.service_path(service).should eq("/servicos/service-slug")
    end
  end
end
