module Site::ProductsHelper
  def product_path(product)
    super({:type => product.type.slug, :product => product.slug} )
  end
end
