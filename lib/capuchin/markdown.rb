module Capuchin
  class Markdown
    def initialize
      options = {
        autolink: true, 
        space_after_headers: true,
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        strikethrough: true,
        underline: true,
        superscript: true
      }

      @engine = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    end

    def render(markdown)
      @engine.render(markdown)
    end
  end
end