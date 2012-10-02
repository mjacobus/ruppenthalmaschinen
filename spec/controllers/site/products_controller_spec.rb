require 'spec_helper'

def show(product, options = {})
  get :show, {:type => product.type.slug, :product => product.slug}.merge(options)
end

describe Site::ProductsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      show(Factory.build(:product))
      response.should be_success
    end
  end

end
