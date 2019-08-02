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
    belongs_to :user

    def space_name
      return self[:space_name]
    end

    def description
      return self[:description]
    end

    def price
      return self[:price]
    end

    def available_dates
      # @available_dates = Array(available_from...available_to).map {|date| date.strftime("%Y-%m-%d")}

      # p "-------------------------------  from: #{available_from} to: #{available_to}  -------------------------------"

      date_range = (available_from...available_to)
      # p date_range

      available_dates_arr = date_range.to_a
      # p available_dates_arr

      formatted_dates_arr = available_dates_arr.map { |date| date.strftime("%Y-%m-%d") }
      # p formatted_dates_arr

      @available_dates = formatted_dates_arr
    end
end
