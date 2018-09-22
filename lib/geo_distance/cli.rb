require 'thor'
require 'geo_distance'

module GeoDistance
  class CLI < Thor

    desc "get_customers_in_radius customers_file_path latitude longitude radius",
         "Outputs a list of customers that are inside deisred radius (in meters) from specified location coordinates"
    def get_customers_in_radius(customers_file_path, latitude, longitude, radius)
      customers = GeoDistance::Parser::Json.get_customers_from_file(customers_file_path)
      location = GeoDistance::Model::Location.new(latitude, longitude)
      result = GeoDistance::Operation::Customer.get_customers_in_radius(customers, location, radius)
      sorted_result = GeoDistance::Transformer::Sort.acsending(result, "id")
      serialized_result = GeoDistance::Serializer::Customer.serialize_array(sorted_result, ["name", "id"])
      GeoDistance::Persistence::Console.print_array(serialized_result)
    end

  end
end
