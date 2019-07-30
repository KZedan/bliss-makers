require 'data_mapper'

class Space
    include DataMapper::Resource
  
    property :id,         Serial  
    property :space_name,      String    
    property :description,       Text     
    property :price, Integer
    property :user_id, Integer  

    belongs_to :user
  end