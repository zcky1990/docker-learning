require "google/cloud/pubsub"

module GoogleMessagePublisher
    def self.publish_event(channel_name, body_params)
        pubsub = Google::Cloud::PubSub.new(
            project_id: "rails-pub-sub"
        )

        topic = pubsub.topic "my-topic"
        topic.publish "task completed"

        puts " [x] Sent 'Hello World! via"
    end

end
