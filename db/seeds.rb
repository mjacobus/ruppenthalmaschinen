# encoding: utf-8


# Picture.delete_all
# Product.delete_all
# Service.delete_all
# ProductType.delete_all

@maquina = ProductType.find_or_create_by_name_and_slug_and_sequence!(
  :name => 'Máquina',
  :slug => 'maquinas',
  :sequence => 1
)

@peca = ProductType.find_or_create_by_name_and_slug_and_sequence!(
  :name => 'Peça',
  :slug => 'pecas',
  :sequence => 1
)

@automotivo = Category.find_or_create_by_name!(:name => 'Automotivo')
@moveleiro = Category.find_or_create_by_name!(:name => 'Moveleiro')

1.upto(45) do |i|
  @product = Product.find_or_create_by_name_and_application_and_type_id_and_category_id_and_enabled!(
    :name => "Produto Muito Tri #{i}",
    :application => "Este produto serve para blah blah blah.",
    :type_id => (i%2 == 0) ? @peca.id : @maquina.id,
    :category_id => (i%2 == 0) ? @automotivo.id : @moveleiro.id,
    :enabled => true
  )
  
  @product.features << Feature.find_or_create_by_product_id_and_name_and_value(@product.id, "peso", "#{i} kilos")
  @product.features << Feature.find_or_create_by_product_id_and_name_and_value(@product.id, "altura", "#{i} cm")
end

1.upto(15) do |i|
  Service.find_or_create_by_title_and_description_and_enabled!(
    :title => "Serviço Bala #{i}",
    :description => "Este serviço consiste em blah blah blah.",
    :enabled => true
  )
end
