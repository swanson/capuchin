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

  end
end