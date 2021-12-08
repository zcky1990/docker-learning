class ApiController < ApplicationController
    

    def test_api
        o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
        string = (0...50).map { o[rand(o.length)] }.join
        # GoogleMessagePublisher.publish_event("hello", {"hello": string})
        render json: {"hello": "aaaabima = #{string}"}
    end
end