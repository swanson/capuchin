require "spec_helper"

describe Capuchin::MailChimp do
  
  let(:mc) { Capuchin::MailChimp.new }
  let(:email) { Capuchin::Email.new("spec/fixtures", "2013-09-01-a-test-email.md") }
  let(:list_id) { "ee7084f978" }

  describe ".find_list", vcr: true do
    it "returns a list for a newsletter with a given name" do
      list = mc.find_list("Blog newsletter")
      
      list['id'].should eq list_id
    end
  end

  describe ".schedule", vcr: true do
    it "schedules a campaign with the correct email subject" do
      result = mc.schedule(email, list_id, 105785, "Test", "matt@mdswanson.com")

      result['complete'].should be_true
    end
  end
end