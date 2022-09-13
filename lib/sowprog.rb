require 'uri'
require 'net/http'
require 'base64'
require 'json'
# require 'sowprog/configuration'

class Sowprog
    class Configuration
        attr_accessor :user_name, :password
    end

    def self.fetch(resource)
        uri = "https://agenda.sowprog.com/rest/v1_2/"
        if resource == "scheduledEvents" || resource == "locations" || resource == "scheduledEventsSplitByDate"
            uri = uri + resource + "/search"
        else
            uri = uri + resource
        end
        #resource list : artists, scheduledEvents, scheduledEventsSplitByDate, locations, eventTypes
        url = URI(uri)
        request = Net::HTTP::Get.new(url)
        request["Accept"] = "application/json"
        request["Content-Type"] = "application/json"
        request["Authorization"] =  "Basic " + Base64.encode64("#{Sowprog.configuration.user_name}:#{Sowprog.configuration.password}").strip
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        response = http.request request 
        return response
    end

    def self.scheduled_events
        return JSON.parse(Sowprog.fetch("scheduledEvents").body)
    end

    def self.artists
        return JSON.parse(Sowprog.fetch("artists").body)
    end

    def self.event_types
        return JSON.parse(Sowprog.fetch("eventTypes").body)
    end

    def self.locations
        return JSON.parse(Sowprog.fetch("locations").body)
    end

    def self.scheduled_events_split_by_date 
        return JSON.parse(Sowprog.fetch("scheduledEventsSplitByDate").body)
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