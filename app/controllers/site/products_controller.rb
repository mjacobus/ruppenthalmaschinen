class Site::ProductsController < SiteController
  respond_to :html
  
  def index
    @products = Product.enabled.page(params[:page]).per(params[:per])
    respond_with(@products)
  end

  def show
    
  end
end
