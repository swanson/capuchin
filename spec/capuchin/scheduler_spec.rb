require "spec_helper"

describe Capuchin::Scheduler do

  let(:email) { Capuchin::Email.new("spec/fixtures", "2013-09-01-a-test-email.md") }
  let(:list_id) { "123asdf" }
  let(:template_id) { 1337 }
  let(:from_name) { "Test" }
  let(:from_email) { "test@example.com" }
  let(:delivery_time) { "10:30:00" }
  let(:options) {
    {
      'list_id' => list_id,
      'template_id' => template_id,
      'from_name' => from_name,
      'from_email' => from_email,
      'delivery_time' => delivery_time
    }
  }

  let(:fake_api) { double }

  let(:scheduler) { Capuchin::Scheduler.new(email, options, fake_api) }

  describe ".schedule", vcr: true do
    it "schedules the email for delivery" do
      fake_api.should_receive(:schedule)
        .with(email, list_id, template_id, from_name, from_email, delivery_time)
        .and_return({'complete' => true})

      result = scheduler.schedule
      
      result.should include "A Test Email was scheduled to be sent"
    end
  end
end