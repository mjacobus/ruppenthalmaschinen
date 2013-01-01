# encoding: UTF-8

ActiveAdmin.register Classification do
  menu parent: Product.model_name.human
  
  controller do
    cache_sweeper :product_sweeper
  end
end
