module Capuchin
  class HighlightingRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.highlight(code, language)
    end
  end

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

      renderer = HighlightingRenderer.new
      @engine = Redcarpet::Markdown.new(renderer, options)
    end

    def render(markdown)
      @engine.render(markdown)
    end
  end
end