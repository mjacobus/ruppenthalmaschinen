class PictureSweeper < ActionController::Caching::Sweeper
  observe Picture
 
  def after_create(picture)
    expire_cache_for(picture)
  end
 
  def after_update(picture)
    expire_cache_for(picture)
  end
 
  def after_destroy(picture)
    expire_cache_for(picture)
  end
 
  private
  def expire_cache_for(picture)
    if picture.imageable_type == "Product"
      product = Product.find(picture.imageable_id)
      ProductSweeper.instance.after_create(product)
    elsif picture.imageable_type == "Service"
      service = Service.find(picture.imageable_id)
      ServiceSweeper.instance.after_create(service)
    end
  end
end