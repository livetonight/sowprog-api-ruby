require 'uri'
require 'net/http'
require 'base64'
require 'json'
require 'sowprog-api-ruby/configuration'



module SowprogApiRuby 
    class << self
        attr_accessor :configuration
      end
    
      def self.configuration
        @configuration ||= Configuration.new
      end
    
      def self.reset
        @configuration = Configuration.new
      end
    
      def self.configure
        yield(configuration)
      end

      class SowprogApiRuby
        def self.scheduled_events
            puts "scheduled_events!"
            url = URI('https://agenda.sowprog.com/rest/v1_2/scheduledEvents/search')
            request = Net::HTTP::Get.new(url)
            request["Accept"] = "application/json"
            request["Content-Type"] = "application/json"
            request["Authorization"] =  "Basic " + Base64.encode64("#{SowprogApiRuby.configuration.username
                }:#{SowprogApiRuby.configuration.password}").strip
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            response = http.request request
            return JSON.parse(response.body)
        end
    end

end



# SowprogApiRuby::ScheduledEvents.fetch
# SowprogApiRuby.scheduled_events