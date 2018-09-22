module GeoDistance::Operation
  class Customer
    class << self

      def get_customers_in_radius(customers, location, radius)
        result = []
        maximum_distance = Float(radius)
        # rewrite as map?
        customers.each do |customer|
          distance_to_location = customer.location.distance_to(location)
          if distance_to_location <= maximum_distance
            result << customer
          end
        end
        result
      end

    end
  end
end
