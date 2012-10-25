# encoding: UTF-8

ActiveAdmin.register Service do
  index do
    column :picture do |service|
      picture = service.pictures.first
      if picture
        img :src => picture.file.url(:thumb)
      end
    end
    
    column :title
    
    column :home do |product|
      product.home? ? 'Sim' : 'Não'
    end
    
    column :enabled do |product|
      product.enabled? ? 'Sim' : 'Não'
    end
    
    column :images do |service|
      link_to t(:manage), "/admin/services/#{service.id}/pictures"
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
