module Site::ServicesHelper
  def service_path(service)
    super(:service => service.slug)
  end
end
