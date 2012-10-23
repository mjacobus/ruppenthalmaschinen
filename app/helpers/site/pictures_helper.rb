module Site::PicturesHelper
  def picture(picture, size = :original, options = {})
    if picture
      options.merge({:alt => picture.title, :title => picture.title})
      image_tag(picture.file.url(size), options)
    end
  end
end
