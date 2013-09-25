module Capuchin
  class Scheduler
    def initialize(email, options, api = Capuchin::MailChimp.new)
      @email = email
      @options = options

      @api = api
    end

    def schedule
      result = @api.schedule(@email, list_id, template_id, from_name, from_email, delivery_time)

      if result['complete']
        "#{@email.subject} was scheduled to be sent."
      else
        raise "Something went wrong!"
      end
    end

    private
      def list_id
        @options['list_id']
      end

      def template_id
        @options['template_id']
      end

      def from_name
        @options['from_name']
      end

      def from_email
        @options['from_email']
      end

      def delivery_time
        @options['delivery_time']
      end
  end
end