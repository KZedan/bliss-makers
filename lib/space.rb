require 'data_mapper'

class Space
    include DataMapper::Resource

    property :id,         Serial
    property :space_name,      String
    property :description,       Text
    property :price, Integer
    property :user_id, Integer
    property :available_from, Date
    property :available_to, Date
    property :available_dates, Date
    belongs_to :user


    def self.available_dates
      @spaces = Space.all

        @spaces.each do |space|
           p available_from = space.available_from
           p available_to = space.available_to
           p date_range = available_from...available_to
           available_dates = date_range.to_a
        end
        available_dates
    end

end
