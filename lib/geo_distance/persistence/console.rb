module GeoDistance::Persistence
  class Console
    class << self
      def print(data)
        p data
      end

      def print_array(data)
        data.each do |row|
          p row
        end
      end
    end
  end
end
