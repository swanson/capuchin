module Capuchin
  class Scheduler
    def initialize(email, list_name, api = Capuchin::MailChimp.new)
      @email = email
      @list_name = list_name

      @api = api
    end

    def schedule
      list = @api.find_list(@list_name)

      list_size = list['stats']['members_count']

      result = @api.schedule(@email, list['id'])

      if result['complete']
        "#{@email.subject} was scheduled to be sent to #{list_size} people"
      else
        raise "Something went wrong!"
      end
    end
  end
end