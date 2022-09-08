require 'sowprog-api-ruby'


def sowprog_configuration
RSpec.configure do |config|
    config.before(:all) do
      SowprogApiRuby.configure do |config|
        config.username = ENV['SAR_USERNAME']
        config.password = ENV['SAR_PASSWORD']
      end
    end
  end
end
sowprog_configuration