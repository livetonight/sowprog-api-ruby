module Sowprog
    class Configuration
        attr_accessor :user_name, :password
        def initialize
            @user_name = nil
            @password = nil
          end
    end
end