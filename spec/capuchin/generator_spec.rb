require "spec_helper"

describe Capuchin::Generator do

  let(:email) { Capuchin::Email.new("spec/fixtures", "2013-09-01-a-test-email.md") }
  let(:generator) { Capuchin::Generator.new(email) }

  describe ".write" do
    it "writes the email's html contents to disk" do
      generator.write("/tmp")

      result = File.open("/tmp/#{email.output_filename}").read
      result.should include(email.content)
    end
  end
end