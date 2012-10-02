Diego::Application.routes.draw do
  
  ##############################################################################
  # site routes
  ##############################################################################
  get "/produtos(/:page)" => "site/products#index",
    :constraints => {:page => /\d{1,}/}, :as => :products
    
  get "/produtos/:type(/:page)" => "site/products#index",
    :constraints => {:page => /\d{1,}/}, :as => :product_type
    
  get "/produtos/:type/:product" => "site/products#show", :as => :product

  


  ##############################################################################
  # ative admin
  ##############################################################################
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end
