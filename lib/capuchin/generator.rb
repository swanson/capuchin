module Capuchin
  class Generator
    def initialize(email)
      @email = email
    end

    def write(folder)
      path = File.join(folder, @email.output_filename)
      FileUtils.mkdir_p(File.dirname(path))

      File.open(path, 'wb') do |f|
        f.write(@email.content)
      end
    end
  end
end