class Site::ProductsController < SiteController
  respond_to :html
  
  def index
    @products = Product.enabled.page(params[:page]).per(params[:per])
    respond_with(@products)
  end

  def show
    @product = Product.enabled.find_by_slug(params[:product])
    
    raise("Produto não encontrado") unless @product

    respond_with(@product)
  end
end
