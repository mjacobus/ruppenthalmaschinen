class ServiceSweeper < ActionController::Caching::Sweeper
  observe Service
 
  def after_create(service)
    expire_cache_for(service)
  end
 
  def after_update(service)
    expire_cache_for(service)
  end
 
  def after_destroy(service)
    expire_cache_for(service)
  end
 
  private
  def expire_cache_for(service)
    expire_page(:controller => 'site/home', :action => 'index')
 
    FileUtils.rm_rf "#{Rails.public_path}/servicos"
    FileUtils.rm_rf "#{Rails.public_path}/servicos.html"
  end
end