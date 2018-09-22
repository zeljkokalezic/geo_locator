module GeoDistance::Splitter
  class Character
    class << self
      def split(input, split_symbol)
        input.split(split_symbol)
      end
    end
  end
end
