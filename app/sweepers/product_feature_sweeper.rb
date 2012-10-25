class ProductFeatureSweeper < ActionController::Caching::Sweeper
  observe Feature
 
  def after_create(feature)
    expire_cache_for(feature)
  end
 
  def after_update(feature)
    expire_cache_for(feature)
  end
 
  def after_destroy(feature)
    expire_cache_for(feature)
  end
 
  private
  def expire_cache_for(feature)
    ProductSweeper.instance.after_create(feature.product)
  end
end