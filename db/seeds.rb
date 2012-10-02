# encoding: utf-8


# Picture.delete_all
# Product.delete_all
# Service.delete_all
# ProductType.delete_all

@maquina = ProductType.create!(
  :name => 'Máquina',
  :slug => 'maquinas',
  :sequence => 1
)

@peca = ProductType.create!(
  :name => 'Peça',
  :slug => 'pecas',
  :sequence => 1
)

1.upto(45) do |i|
  Product.create!(
    :name => "Produto Muito Tri #{i}",
    :application => "Este produto serve para blah blah blah.",
    :type_id => (i%2 == 0) ? @peca.id : @maquina.id
  )
end

1.upto(15) do |i|
  Service.create!(
    :title => "Serviço Bala #{i}",
    :description => "Este serviço consiste em blah blah blah.",
    :enabled => true
  )
end
