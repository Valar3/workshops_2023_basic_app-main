module Publishers
  class Application
    require 'bunny'
    def initialize(message:, exchange_name:, routing_key:)
      @message = message
      @exchange_name = exchange_name
      @routing_key = routing_key
    end

    def perform
      connection.start
      chanel = connection.create_channel
      chanel.direct(exchange_name).publish(message.to_json, routing_key:)
      connection.close
    end

    private

    def connection_options
      {
        host: 'localhost',
        port: '5672',
        vhost: '/',
        username: 'guest',
        password: 'guest'
      }
    end

    def connection
      @connection ||= Bunny.new(connection_options)
    end
    attr_reader :message, :exchange_name, :routing_key
  end
end
