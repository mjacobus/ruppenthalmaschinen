# encoding: UTF-8

class Site::ProductsController < SiteController
  respond_to :html
  
  # /produtos(/:page)
  # /produtos/:type(/:page)
  def index
    @products = Product.enabled
    
    if params[:type].present?
      type = ProductType.find_by_slug(params[:type])
      raise_404("Tipo de produto não encontrado") unless type
      @products = @products.where(:type_id => type.id)
    end
    
    @products = @products.page(params[:page]).per(params[:per])
    respond_with(@products)
  end

  # /produtos/:type/:product
  def show
    @product = Product.enabled.find_by_slug(params[:product])
    
    raise_404("Produto não encontrado") unless @product

    respond_with(@product)
  end
end
