module Capuchin
  class Scheduler
    def initialize(email, options, api = Capuchin::MailChimp.new)
      @email = email
      @options = options

      @api = api
    end

    def schedule
      list = @api.find_list(list_name)
      list_size = list['stats']['member_count']

      result = @api.schedule(@email, list['id'], template_id, from_name, from_email)

      if result['complete']
        "#{@email.subject} was scheduled to be sent to #{list_size} people"
      else
        raise "Something went wrong!"
      end
    end

    private
      def list_name
        @options['list_name']
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
  end
end