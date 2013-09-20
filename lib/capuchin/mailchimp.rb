module Capuchin
  class MailChimp
    def initialize
      @client = Gibbon::API.new
    end

    def find_list(list_name)
      list = @client.lists.list(filters: { listname: list_name }, limit: 1)
      list['data'].first
    end

    def schedule(email, list_id, template_id, from_name, from_email)
      campaign = create_campaign(email, list_id, template_id, from_name, from_email)
      schedule_delivery(campaign['id'])
    end

    private
      def create_campaign(email, list_id, template_id, from_name, from_email)
        campaign_options = build_campaign_options(email, list_id, template_id, from_name, from_email)
        @client.campaigns.create(campaign_options)
      end

      def schedule_delivery(campaign_id)
        @client.campaigns.schedule(build_schedule_options(campaign_id))
      end

      def build_campaign_options(email, list_id, template_id, from_name, from_email)
        {
          type: "regular",
          options: {
            list_id: list_id,
            subject: email.subject,
            from_name: from_name,
            from_email: from_email,
            generate_text: true,
            template_id: template_id
          },
          content: {
            sections: {
              main: email.content
            }
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
