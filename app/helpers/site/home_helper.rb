module Site::HomeHelper
  def home_products
    Product.on_home_page
  end
  
  def home_services
    Service.on_home_page
  end
end
