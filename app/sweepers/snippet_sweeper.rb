class SnippetSweeper < ActionController::Caching::Sweeper
  observe Snippet
 
  # If our sweeper detects that a snippet was created call this
  def after_create(snippet)
    expire_cache_for(snippet)
  end
 
  # If our sweeper detects that a snippet was updated call this
  def after_update(snippet)
    expire_cache_for(snippet)
  end
 
  # If our sweeper detects that a snippet was deleted call this
  def after_destroy(snippet)
    expire_cache_for(snippet)
  end
 
  private
  def expire_cache_for(snippet)
    # Expire the index page now that we added a new snippet
    expire_page(:controller => 'site/home', :action => 'index')
  end
end