module Capuchin
  class Shell
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def schedule(path)
      dir = File.dirname(path)
      filename = File.basename(path)
      
      email = Capuchin::Email.new(dir, filename)

      puts Capuchin::Scheduler.new(email, @options).schedule
    end

    def scaffold(path)
      directory_path = File.expand_path(path, Dir.pwd)
      
      FileUtils.mkdir_p(directory_path)
      FileUtils.cp_r sample_directory + '/.', directory_path

      puts "Capuchin directory structure created in #{directory_path}"
    end

    def create(subject)
      slug = slugify(subject)
      filename = "#{Time.now.strftime('%Y-%m-%d')}-#{slug}.md"

      File.open(File.join("_emails", filename), 'w') do |f|
        f.write <<-eos
---
subject: "#{subject}"
---

Write your kick-ass content here!
        eos
      end

      puts "Created _emails/#{filename}"
    end

    private
      def sample_directory
        File.expand_path("../sample_directory", File.dirname(__FILE__))
      end

      def slugify(text)
        text.scan(/\w+/).join("-").downcase
      end
  end
end