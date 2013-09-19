require "spec_helper"

describe Capuchin::Scheduler do

  let(:email) { Capuchin::Email.new("spec/fixtures", "2013-09-01-a-test-email.md") }
  let(:list_name) { "Blog newsletter" }
  let(:list_id) { "123asdf"}

  let(:fake_api) do
    api = double
    api.stub(:find_list).and_return({ 'id' => list_id, 'stats' => {'members_count' => 53 } })
    api
  end

  let(:scheduler) { Capuchin::Scheduler.new(email, list_name, fake_api) }

  describe ".schedule", vcr: true do
    it "schedules the email for delivery" do
      fake_api.should_receive(:schedule).with(email, list_id)
              .and_return({'complete' => true})

      result = scheduler.schedule
      
      result.should eq "A Test Email was scheduled to be sent to 53 people"
    end
  end
end