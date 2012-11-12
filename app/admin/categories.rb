ActiveAdmin.register Category do
  controller do
    cache_sweeper :product_sweeper
  end
end
