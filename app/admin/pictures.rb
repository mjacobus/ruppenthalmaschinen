ActiveAdmin.register Picture do
  
  controller do
    cache_sweeper :picture_sweeper
  end
  
  menu false
  config.clear_sidebar_sections!
   
  controller.belongs_to :product, :service, :polymorphic => true
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :sequence
      f.input :description
      f.input :file, :as => :file,
        :hint => (f.template.image_tag(f.object.file.url(:medium)) if f.object.file?)
    end
    
    f.buttons
  end
  
  index do
    column :picture do |picutre|
      div :class => "logo thumb" do
        img :src => picutre.file.url(:thumb), :alt => picutre.title, :title => picutre.title    
      end
    end
    
    column :title
    column :created_at
    column :updated_at
    
    default_actions
  end
  
  
  show do |picture|
    attributes_table_for picture do
      row :title
      row :file do 
        img :src => picture.file.url(:medium)
      end
      
      row :description
      row :sequence
    
      row :created_at
      row :updated_at
    end
  end
  
end
