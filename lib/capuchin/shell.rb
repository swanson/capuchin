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

      email_files.each do |file_path|
        dir, filename = file_path.split("/")
        email = Capuchin::Email.new(dir, filename)

        Capuchin::Generator.new(email).write("_output")
      end
    end

    def schedule(filename)
      contents = File.open(filename).read
      email = Capuchin::Email.new(filename, contents)

      Capuchin::Generator.new(email).write
      Capuchin::Scheduler.new(email).schedule
    end
  end
end