module Site::HomeHelper
  def home_products
    Product.enabled.on_home_page
  end
  
  def home_services
    Service.enabled.on_home_page
  end
end
