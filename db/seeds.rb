# encoding: utf-8


# Picture.delete_all
# Product.delete_all
# Service.delete_all
# ProductType.delete_all

IMAGE_PATH = Rails.root. + 'db/seeds/pictures'

def add_pictures(picturable)
  (1..5).to_a.slice(rand(6),rand(6)).each do |num|
    picturable.pictures.create!(file: File.open("#{IMAGE_PATH}/#{"%02d" % num}.jpg"))
  end
end

def loren_ipsun
<<LOREN
  Lorem ipsum dolor sit amet, labores nostrum mei cu, cu vis mundi iisque dolores. Imperdiet philosophia te vis, nam ad rebum regione accusamus. Omnis propriae per an, id ipsum erant his. Sea te nullam persecuti, eu sit audire scripta eruditi, cu vix quidam tincidunt definiebas.

  Dolor mnesarchum ei mea, nulla denique cu qui. Possit commune definiebas ex sit, ad vim denique minimum adipiscing. Mei veritus abhorreant constituto ut, porro adipiscing nec ex. No populo praesent mea. Duo solum aliquid disputando no.
LOREN
end

@maquina = ProductType.find_or_create_by_name_and_slug_and_sequence!(
  :name => 'Máquina',
  :slug => 'maquinas',
  :sequence => 1
)

@peca = ProductType.find_or_create_by_name_and_slug_and_sequence!(
  :name => 'Peça',
  :slug => 'pecas',
  :sequence => 2
)

@automotivo = Category.find_or_create_by_name!(:name => 'Automotivo')
@moveleiro = Category.find_or_create_by_name!(:name => 'Moveleiro')

1.upto(45) do |i|
  home = rand(10) == 9
  @product = Product.find_or_create_by_name_and_application_and_type_id_and_category_id_and_enabled!(
    :name => "Produto #{i}",
    :application => loren_ipsun,
    :type_id => (i%2 == 0) ? @peca.id : @maquina.id,
    :category_id => (i%2 == 0) ? @automotivo.id : @moveleiro.id,
    :enabled => true,
    :home => home,
    :video => home ? 'YBrTccemsOc' : nil,
    :video_description => home ? loren_ipsun : nil
  )
  
  @product.features << Feature.find_or_create_by_product_id_and_name_and_value(@product.id, "peso", "#{i} kilos")
  @product.features << Feature.find_or_create_by_product_id_and_name_and_value(@product.id, "altura", "#{i} cm")
  add_pictures @product
end

1.upto(15) do |i|
  home = rand(10) == 9
  add_pictures Service.find_or_create_by_title_and_description_and_enabled!(
    :title => "Serviço #{i}",
    :description => loren_ipsun,
    :enabled => true,
    :home => home,
  )
end

unless Snippet.find_by_slug('home.descricao')
  Snippet.create!({
    :slug => 'home.descricao',
    :title => 'Descrição da home',
    :content => 'A RUPPENTHAL & RUPPENTHAL é uma empresa do ramo metalúrgico que têm suas atividades direcionadas para construção mecânica de máquinas e equipamentos para a indústria. Fundada em 2011 está localizada no importante pólo industrial do Vale do Sinos em Novo Hamburgo/RS. A empresa apresenta soluções em projetos e construção de equipamentos baseado na otimização e na eficiência de funcionamento destes, bem como na automação e racionalização do processo, sempre buscando a racionalização de mão de obra, aumento de produtividade e economia de recursos.'
  })
end

unless Snippet.find_by_slug('sobre-a-empresa.descricao')
  Snippet.create!({
    :slug => 'sobre-a-empresa.descricao',
    :title => 'Descrição da home',
    :content => "A RUPPENTHAL & RUPPENTHAL é uma empresa do ramo metalúrgico que têm suas atividades direcionadas para construção mecânica de máquinas e equipamentos para a indústria. Fundada em 2011 está localizada no importante pólo industrial do Vale do Sinos em Novo Hamburgo/RS. A empresa apresenta soluções em projetos e construção de equipamentos baseado na otimização e na eficiência de funcionamento destes, bem como na automação e racionalização do processo, sempre buscando a racionalização de mão de obra, aumento de produtividade e economia de recursos.

Para a obtenção destes resultados dispomos de uma equipe de profissionais capacitados e comprometidos com seus objetivos, que além de atender, espera superar as necessidades dos desafios propostos.

Contamos com o trabalho sério e inovador de toda a equipe, que crê na união de idéias para a obtenção de resultados excepcionais."
  })
end