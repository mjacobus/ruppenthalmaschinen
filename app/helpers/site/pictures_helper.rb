module Site::PicturesHelper
  def picture(picture, size = :original, options = {})
    if picture
      options.merge({:alt => picture.title, :title => picture.title})
      image_tag(picture.file.url(size), options)
    else
      image_tag("default_#{size}.jpg")
    end
  end
end