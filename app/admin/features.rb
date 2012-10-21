ActiveAdmin.register Feature do
  belongs_to :product
  config.clear_sidebar_sections!
  
  form do |f|
    f.inputs :name, :value, :sequence
    f.actions
  end
end
