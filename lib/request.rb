require 'data_mapper'

class Request

 include DataMapper::Resource

  property :id,         Serial
  property :confirmed,     Boolean,  :default => false
  property :user_id, Integer
  property :space_id, Integer
  property :check_in , Date
  property :space_name, String

  belongs_to :user
  belongs_to :space
end
