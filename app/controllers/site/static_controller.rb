class Site::StaticController < SiteController
  def index
    template = Rails.root.join("app","views","site","static","#{params[:page]}.html.erb")
    if File.exists?(template)
      render params[:page]
    else
      raise_404
    end
  end
end
