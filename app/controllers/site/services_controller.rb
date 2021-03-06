# encoding: UTF-8

class Site::ServicesController < SiteController
  caches_page :index, :show
  
  respond_to :html
  
  def index
    @services = Service.enabled.page(params[:page]).per(params[:per])
    respond_with(@services)
  end

  def show
    @service = Service.enabled.find_by_slug(params[:service])
    
    raise("Serviço não encontrado") unless @service
    
    respond_with(@service)
  end
end
