ActiveAdmin.register Product do
  index do
    column :picture do |product|
      picture = product.pictures.first
      if picture
        img :src => picture.file.url(:thumb)
      end
    end
    column :name
    column :category
    column :images do |product|
      link_to t(:manage), "/admin/products/#{product.id}/pictures"
    end
    
    default_actions
    
  end


  sidebar I18n.t(:pictures), :except => [:index, :new] do
    ul do
      product.pictures.each do |picture|
        li img :src => picture.file.url(:small)
      end
      
      li link_to t(:manage), "/admin/products/#{product.id}/pictures"
    end
  end
end
