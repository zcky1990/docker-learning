require 'mongoid'
require_relative "../app/models/test_models"
require "spec_helper"

RSpec.describe 'testing add rspec', :type => :model do
    it 'was amazing' do
        a = TestModels.new(first_name: "as_F", middle_name: "as_M", last_name: "as_L" )
        a.save
        expect(1).to eq 1
    end
end