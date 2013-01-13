module Site::HomeHelper
  def home_products
    Product.enabled.on_home_page
  end
  
  def home_services
    Service.enabled.on_home_page
  end
  
  def home_video
    product = home_products.where('video IS NOT NULL AND video != ""').first

    unless product.nil? || product.video.nil? || product.video.empty?
      video = content_tag('iframe', nil, {
        :width => 420,
        :height => 315,
        :src => "http://www.youtube.com/embed/#{product.video}?rel=0&controls=2&showinfo=0&theme=light&=1",
        :frameborder => 0,
        :allowfullscreen => :allowfullscreen
      })
      description = simple_format(product.video_description)
      link = link_to("Veja Mais", product_path(product), class: 'read-more', alt: 'Veja Mais')

      content_tag(:article, video + description + link, class: 'home-video')
    end
  end
end
