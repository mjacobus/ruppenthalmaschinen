# encoding: UTF-8

ActiveAdmin.register Classification do
  controller do
    cache_sweeper :product_sweeper
  end
end
