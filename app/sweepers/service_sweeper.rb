class ServiceSweeper < ActionController::Caching::Sweeper
  observe Service # This sweeper is going to keep an eye on the Product model
 
  # If our sweeper detects that a Product was created call this
  def after_create(service)
    expire_cache_for(service)
  end
 
  # If our sweeper detects that a Product was updated call this
  def after_update(service)
    expire_cache_for(service)
  end
 
  # If our sweeper detects that a Product was deleted call this
  def after_destroy(service)
    expire_cache_for(service)
  end
 
  private
  def expire_cache_for(service)
    # Expire the index page now that we added a new product
    expire_page(:controller => 'site/home', :action => 'index')
 
    FileUtils.rm_rf "#{Rails.public_path}/servicos"
  end
end