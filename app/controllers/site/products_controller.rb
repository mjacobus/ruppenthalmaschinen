# encoding: UTF-8

class Site::ProductsController < SiteController
  caches_page :show, :index
  
  respond_to :html
  
  # /produtos(/:page)
  # /produtos/:category(/:page)
  def index
    @products = Product.enabled
    
    if params[:category].present?
      category = Category.find_by_slug(params[:category])
      raise_404("Categoria não encontrada") unless category
      @products = @products.where(:category_id => category.id)
    end
    
    @products = @products.page(params[:page]).per(params[:per])
    respond_with(@products)
  end

  # /produtos/:category/:product
  def show
    @product = Product.enabled.find_by_slug(params[:product])
    
    raise_404("Produto não encontrado") unless @product

    respond_with(@product)
  end
end
