module SchoologyClient
  class Configuration
    attr_accessor :oauth_consumer_key, :oauth_consumer_secret, :url

    def initialize
      @oauth_consumer_key = nil
      @oauth_consumer_secret = nil
      @url = nil
    end

  end
end
