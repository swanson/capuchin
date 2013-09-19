require "spec_helper"

describe Capuchin::Email do

  let(:email) { Capuchin::Email.new("spec/fixtures", "2013-09-01-a-test-email.md") }
  let(:future_email) { Capuchin::Email.new("spec/fixtures", "2013-09-01-a-future-email.md") }

  describe ".new" do

    it "parses fields from YAML front matter" do
      email.subject.should eq "A Test Email"
    end

    it "parses fields from filename" do
      email.date.should eq Date.new(2013, 9, 1)
      email.slug.should eq "a-test-email"
    end

    it "overwrites filename fields with front matter" do
      future_email.date.should eq Date.new(2013, 9, 8)
    end

    it "converts the markdown email to HTML" do
      email.content.should include("This is a test email")
      email.content.should include("<em>Markdown</em>")
      email.content.should include("<a href=\"http://google.com\">link</a>")
    end

    it "knows the filename to export to" do
      email.output_filename.should eq "2013-09-01-a-test-email.html"
    end
  end
end