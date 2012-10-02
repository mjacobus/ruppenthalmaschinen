Diego::Application.routes.draw do
  
  get "static/about"

  ##############################################################################
  # site routes
  ##############################################################################
  
  # site/products controller
  
  get "/produtos(/:page)" => "site/products#index",
    :constraints => {:page => /\d{1,}/}, :as => :products
    
  get "/produtos/:type(/:page)" => "site/products#index",
    :constraints => {:page => /\d{1,}/}, :as => :product_type
    
  get "/produtos/:type/:product" => "site/products#show", :as => :product
  
  
  # site/services controller
  
  get "/servicos(/:page)" => "site/services#index",
    :constraints => {:page => /\d{1,}/}, :as => :services
    
  get "/servicos/:service" => "site/services#show", :as => :service

  # static
  get ":page.html" => "site/static#index", :as => :static

  ##############################################################################
  # ative admin
  ##############################################################################
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end
