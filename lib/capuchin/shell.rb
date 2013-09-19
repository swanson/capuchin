module Capuchin
  class Shell
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def schedule(filename)
      contents = File.open(filename).read
      email = Capuchin::Email.new(filename, contents)

      Capuchin::Scheduler.new(email).schedule
    end
  end
end