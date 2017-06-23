class Renderer
  def self.call(str)
    markdown.render(str)
  end

  private
  
  def self.markdown
    @markdown ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(
        filter_html: true, hard_wrap: true, safe_links_only: true,
      ),
      fenced_code_blocks: true, disable_indented_code_blocks: true,
      no_intra_emphasis: true, strikethrough: true
    )
  end
end
