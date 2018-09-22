module GeoDistance::Serializer
  class Customer
    class << self
      def serialize(data, attributes)
        attributes.map do |attribute|
          data.public_send(attribute)
        end
      end

      def serialize_array(data, attributes)
        data.map do |row|
          serialize(row, attributes)
        end
      end
    end
  end
end
