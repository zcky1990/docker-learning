class TestModels
    include Mongoid::Document
    include Mongoid::Timestamps
    
    store_in collection: "test"

    field :first_name, type: String
    field :middle_name, type: String
    field :last_name, type: String
end