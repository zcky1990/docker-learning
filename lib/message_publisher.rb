require 'bunny'

module MessagePublisher
    def self.publish_event(channel_name, body_params)
        connection = Bunny.new(
            host: '172.18.0.1',
            port: 5672,
            vhost: '/',
            user: 'guest',
            password: 'guest')
        connection.start

        channel = connection.create_channel
        queue = channel.queue(channel_name)

        channel.default_exchange.publish(body_params.to_json, routing_key: queue.name)
        puts " [x] Sent 'Hello World! via #{channel_name} data sent is : #{body_params.to_json}'"
    end

end