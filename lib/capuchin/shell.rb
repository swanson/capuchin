module Capuchin
  class Shell
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def ping
      puts "Pong!"
    end

    def build
      email_files = Dir.glob("_emails/*.{md,markdown}")
      puts "Processing #{email_files.size} emails..."
      
      email_files.each do |file_path|
        dir, filename = file_path.split("/")
        email = Capuchin::Email.new(dir, filename)

        puts "Writing #{email.output_filename}..."
        Capuchin::Generator.new(email).write("_output")
      end

      puts "Done."
    end

    def schedule(filename)
      contents = File.open(filename).read
      email = Capuchin::Email.new(filename, contents)

      Capuchin::Generator.new(email).write
      Capuchin::Scheduler.new(email).schedule
    end
  end
end