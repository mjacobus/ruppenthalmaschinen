# encoding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception,                           :with => :render_500
    rescue_from ActiveRecord::RecordNotFound,        :with => :render_404
    rescue_from ActionController::RoutingError,      :with => :render_404
    rescue_from ActionController::UnknownController, :with => :render_404
    rescue_from ActionController::UnknownAction,     :with => :render_404
  end
  
  def raise_404(message = "Página não encontrada")
    raise ActionController::RoutingError.new(message)
  end
  
  def log_exception(exception)
    Rails.logger.error exception
  end
  
private
  def render_404(exception)
    log_exception exception
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render :template => 'site/static/404', :status => 404 }
      format.all { render :nothing => true, :status => 404 }
    end
  end

  def render_500(exception)
    log_exception exception
    @error = exception
    respond_to do |format|
      format.html { render :template => 'site/static/500', :status => 500 }
      format.all { render :nothing => true, :status => 500 }
    end
  end
end
