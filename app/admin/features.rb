ActiveAdmin.register Feature do
  belongs_to :product
  config.clear_sidebar_sections!
end
