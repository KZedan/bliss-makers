
require 'data_mapper'

class User
  attr_reader :user_name

  include DataMapper::Resource
  
  property :id,         Serial 
  property :user_name,      String  , :reader => :private
  property :email,       String     
  property :password, String  

  has n, :spaces
end
