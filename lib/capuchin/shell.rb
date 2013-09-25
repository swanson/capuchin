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
    end

    private
      def sample_directory
        File.expand_path("../sample_directory", File.dirname(__FILE__))
      end
  end
end