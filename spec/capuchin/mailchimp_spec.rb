require "spec_helper"

describe Capuchin::MailChimp do
  
  let(:mc) { Capuchin::MailChimp.new }
  let(:email) { Capuchin::Email.new("spec/fixtures", "2013-09-01-a-test-email.md") }
  let(:list_id) { "88300e1d4f" }
  let(:template_id) { 34557 }
  let(:time) { "08:00:00" }

  describe ".find_list", vcr: true do
    it "returns a list for a newsletter with a given name" do
      list = mc.find_list("Blog newsletter")
      
      list['id'].should eq list_id
    end
  end

  describe ".schedule", vcr: true do
    it "schedules a campaign with the correct email subject" do
      result = mc.schedule(email, list_id, template_id, "Test", "matt@mdswanson.com", time)

      result['complete'].should be_true
    end
  end
end