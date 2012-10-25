ActiveAdmin.register Feature do
  controller do
    cache_sweeper :product_feature_sweeper
  end
  
  belongs_to :product
  config.clear_sidebar_sections!
  
  form do |f|
    f.inputs :name, :value, :sequence
    f.actions
  end
end
