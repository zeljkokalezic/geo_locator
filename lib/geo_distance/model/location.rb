module GeoDistance::Model
  class Location
    attr_reader :latitude, :longitude

    def initialize(latitude, longitude)
      @latitude = Float(latitude)
      @longitude = Float(longitude)
    end

    # Calculates distance to other location in meters
    # using Haversine formula: https://en.wikipedia.org/wiki/Haversine_formula
    def distance_to(location)
      delta_latitude_radians = degrees_to_radians(location.latitude - latitude)
      delta_longitude_radians = degrees_to_radians(location.longitude - longitude)

      a = Math.sin(delta_latitude_radians/2)**2 +
          Math.cos(degrees_to_radians(latitude)) *
          Math.cos(degrees_to_radians(location.latitude)) *
          Math.sin(delta_longitude_radians/2)**2

      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      c * earth_radius_in_meters
    end

    private

    def degrees_to_radians(degrees)
      degrees * Math::PI / 180
    end

    def earth_radius_in_meters
      6371 * 1000
    end
  end
end

