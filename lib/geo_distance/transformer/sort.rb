module GeoDistance::Transformer
  class Sort
    class << self
      def acsending(data, sort_by)
        data.sort_by do |row|
          row.public_send(sort_by)
        end
      end
    end
  end
end

