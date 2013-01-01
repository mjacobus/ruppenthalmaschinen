module Site::SnippetHelper
  def snippet(slug = nil)
    @snippets ||= {}
    @snippets[slug] ||= Snippet.find_by_slug(slug).try(:content) || slug
  end
end
