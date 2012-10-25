# encoding: UTF-8

ActiveAdmin.register Product do
  
  controller do
    cache_sweeper :product_sweeper
  end
  
  index do
    column :picture do |product|
      picture = product.pictures.first
      if picture
        img :src => picture.file.url(:thumb)
      end
    end
    column :name
    column :home do |product|
      product.home? ? 'Sim' : 'Não'
    end
    column :enabled do |product|
      product.enabled? ? 'Sim' : 'Não'
    end
    column :category
    column :features do |product|
      link_to t(:manage), "/admin/products/#{product.id}/features"
    end
    column :images do |product|
      link_to t(:manage), "/admin/products/#{product.id}/pictures"
    end
    
    default_actions
    
  end

  sidebar I18n.t(:features), :except => [:index, :new] do
    ul do
      product.features.each do |feature|
        li feature.name + ": " + feature.value
      end
      
      li link_to t(:manage), "/admin/products/#{product.id}/features"
    end
  end
  
  sidebar I18n.t(:pictures), :except => [:index, :new] do
    ul do
      product.pictures.each do |picture|
        li img :src => picture.file.url(:small)
      end
      
      li link_to t(:manage), "/admin/products/#{product.id}/pictures"
    end
  end
  
  sidebar I18n.t(:video), :except => [:index, :new] do
    if product.video
      link_to "Vídeo", "http://www.youtube.com/watch?v=#{product.video}"
    end
  end
  
  form do |f|
    f.inputs do
      f.input :type
      f.input :category
      f.input :name
      f.input :application
      f.input :video, :hint => raw("O código do youtube: http://www.youtube.com/watch?v=<strong>YBrTccemsOc</strong>")
      f.input :enabled
      f.input :home
    end
    
    f.actions
  end
end
