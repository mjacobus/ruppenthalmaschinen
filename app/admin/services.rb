ActiveAdmin.register Service do
  index do
    column :picture do |service|
      picture = service.pictures.first
      if picture
        img :src => picture.file.url(:small)
      end
    end
    column :title
    column :images do |service|
      link_to t(:manage), "/admin/services/#{service.id}/pictures"
    end
    
    default_actions
    
  end
  
  sidebar :pictures, :except => [:index] do
    ul do
      service.pictures.each do |picture|
        li img :src => picture.file.url(:small)
      end
      
      li link_to t(:manage), "/admin/services/#{service.id}/pictures"
    end
  end
  
end
