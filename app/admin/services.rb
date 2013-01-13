# encoding: UTF-8

ActiveAdmin.register Service do
  
  controller do
    cache_sweeper :service_sweeper
  end
  
  index do
    column :picture do |service|
      picture = service.pictures.first
      if picture
        img :src => picture.file.url(:thumb)
      end
    end
    
    column :title
    
    column :home, sortable: :home do |product|
      t(product.home?).to_s
    end
    
    column :enabled, sortable: :enabled do |product|
      t(product.enabled?).to_s
    end
    
    default_actions
    
  end
  
  sidebar I18n.t(:pictures), :except => [:index, :new] do
    ul do
      service.pictures.each do |picture|
        li img :src => picture.file.url(:small)
      end
      
      li link_to t(:manage), "/admin/services/#{service.id}/pictures"
    end
  end
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :enabled
      f.input :home
    end
    
    f.actions
  end
  
end
