module GeoDistance::Model
  class Customer
    attr_reader :id, :name, :location

    def initialize(data_hash)
      @location = Location.new(data_hash.fetch("latitude"), data_hash.fetch("longitude"))
      @id = data_hash.fetch("user_id")
      @name = data_hash.fetch("name")
    end
  end
end
