require 'uri'
require 'net/http'
require 'base64'
require 'json'

class SowprogApiRuby
    def self.hi
        puts "Hello world!"
    end

    def self.scheduled_events
        puts "scheduled_events!"
        url = URI('https://agenda.sowprog.com/rest/v1_2/scheduledEvents/search')
        request = Net::HTTP::Get.new(url)
        request["Accept"] = "application/json"
        request["Content-Type"] = "application/json"
        request["Authorization"] =  "Basic " + Base64.encode64("user:password").strip
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        response = http.request request
        return JSON.parse(response.body)
    end
end

# SowprogApiRuby::ScheduledEvents.fetch
# SowprogApiRuby.scheduled_events