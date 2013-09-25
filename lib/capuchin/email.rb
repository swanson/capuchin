module Capuchin
  class Email
    FILENAME_REGEX = /^(\d+-\d+-\d+)-(.*)(\.[^.]+)$/
    FRONT_MATTER_REGEX = /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m

    def initialize(dir, filename)
      @dir = dir
      @filename = filename

      @options = {}
      @renderer = Capuchin::Markdown.new

      parse_file_contents
    end

    def date
      @options['date'] || @date
    end

    def slug
      @slug
    end

    def subject
      @options['subject']
    end

    def content
      @content ||= @renderer.render(@markdown_content)
    end

    def output_filename
      "#{date.strftime('%Y-%m-%d')}-#{slug}.html"
    end
  
    private
      def parse_file_contents
        decode_filename
        split_contents_from_front_matter
      end

      def decode_filename
        m, date_str, @slug, ext = *@filename.match(FILENAME_REGEX)
        @date = Date.parse(date_str)
      end

      def split_contents_from_front_matter
        if file_contents =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
          @markdown_content = $' # Post match content
          @options.merge!(YAML.load($1))
        end
      end

      def file_contents
        @file_contents ||= File.open(File.join(@dir, @filename)).read
      end

  end
end