module Capuchin
  class MailChimp
    def initialize
      @client = Gibbon::API.new
    end

    def find_list(list_name)
      list = @client.lists.list(filters: { listname: list_name }, limit: 1)
      list['data'].first
    end

    def schedule(email, list_id)
      campaign = create_campaign(email, list_id)
      schedule_delivery(campaign['id'])
    end

    private
      def create_campaign(email, list_id)
        campaign_options = build_campaign_options(email, list_id)
        @client.campaigns.create(campaign_options)
      end

      def schedule_delivery(campaign_id)
        @client.campaigns.schedule(build_schedule_options(campaign_id))
      end

      def build_campaign_options(email, list_id)
        {
          type: "regular",
          options: {
            list_id: list_id,
            subject: email.subject,
            from_name: "Matt Swanson",
            from_email: "matt@mdswanson.com",
            generate_text: true
          },
          content: {
            html: email.content
          }
        }
      end

      def build_schedule_options(campaign_id)
        {
          cid: campaign_id,
          schedule_time: "2014-12-30 20:30:00"
        }
      end
  end
end
