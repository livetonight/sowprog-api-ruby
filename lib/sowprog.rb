require 'uri'
require 'net/http'
require 'base64'
require 'json'
# require 'sowprog/configuration'

class Sowprog
    class Configuration
        attr_accessor :user_name, :password
    end

    def self.scheduled_events
        url = URI('https://agenda.sowprog.com/rest/v1_2/scheduledEvents/search')
        request = Net::HTTP::Get.new(url)
        request["Accept"] = "application/json"
        request["Content-Type"] = "application/json"
        request["Authorization"] =  "Basic " + Base64.encode64("#{Sowprog.configuration.user_name}:#{Sowprog.configuration.password}").strip
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        response = http.request request
        return JSON.parse(response.body)
    end


    def self.configuration
        @configuration ||= Configuration.new
    end

    def self.configure(&block)
        yield(configuration)
    end      

end

# Sowprog::ScheduledEvents.fetch
# Sowprog.scheduled_events