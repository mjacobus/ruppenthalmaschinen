# encoding: UTF-8

ActiveAdmin.register Product do
  menu parent: Product.model_name.human, priority: 1
  
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
    column :home, sortable: :home do |product|
      t(product.home?).to_s
    end
    column :peca, sortable: :parent_id do |product|
      if product.parent_id?
        link_to t(product.parent_id?.to_s), admin_product_path(product.parent)
      else
        t(product.parent_id?.to_s)  
      end
    end
    column :enabled, sortable: :enabled do |product|
      t(product.enabled?).to_s
    end
    
    column :category
    
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
  
  sidebar I18n.t(:pieces), :except => [:index, :new] do
    ul do
      product.products.each do |p|
        li link_to(p.name,[:admin,p])
      end
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
      f.input :parent, :hint => t(:if_machine)
      f.input :classification
      f.input :category
      f.input :name
      f.input :application
      f.input :video, :hint => raw("O código do youtube: http://www.youtube.com/watch?v=<strong>YBrTccemsOc</strong>")
      f.input :video_description
      f.input :enabled
      f.input :home
    end
    
    f.actions
  end
end
