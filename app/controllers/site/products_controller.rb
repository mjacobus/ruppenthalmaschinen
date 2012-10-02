class Site::ProductsController < SiteController
  respond_to :html
  
  def index
    @products = Product.enabled
    respond_with(@products)
  end

  def show
    
  end
end
