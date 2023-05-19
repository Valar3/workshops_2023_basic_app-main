module Publishers
  class Application
  require 'bunny'
    def initialize(msg:, exchange:, routing_key:)
      @msg = msg
      @exchange = exchange
      @routing_key = routing_key
    end
    def perform
      connection.start
      chanel = connection.create_channel
      chanel.direct(@exchange).publish(@msg.to_json, routing_key: @routing_key)
      connection.close
    end
    private

    def connection_options
      {
        host: "localhost",
        port: "5672",
        vhost: "/",
        username: "guest",
        password: "guest"
      }
    end
    def connection
      @connection ||= Bunny.new(connection_options)
    end
  end
end
