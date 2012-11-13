module Site::ProductsHelper
  def product_path(product)
    super({:category => product.category.slug, :product => product.slug} )
  end
end
