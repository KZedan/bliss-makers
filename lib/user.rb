
require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  
  property :id,         Serial 
  property :user_name,      String  
  property :email,       String      
  property :password, BCryptHash

  has n, :spaces

  def self.authenticate(email)
    user = first(:email => email)
    return nil if user.nil?
    user
  end

  def user_name
    return self[:user_name]
  end

  def id
    return self[:id]
  end

  def space_id
    return self[:space_id]
  end
end
