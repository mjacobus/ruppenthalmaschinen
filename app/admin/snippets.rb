ActiveAdmin.register Snippet do
  menu priority: 19
  
  controller do
    cache_sweeper :snippet_sweeper
  end
end