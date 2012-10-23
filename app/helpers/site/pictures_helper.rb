module Site::PicturesHelper
  def picture(picture, size = :original)
    if picture
      image_tag picture.file.url(size), :alt => picture.title, :title => picture.title
    end
  end
end
