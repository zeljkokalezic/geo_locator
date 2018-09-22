require "json"

module GeoDistance::Parser
  class Json
    class << self

      def get_customers_from_file(file_path)
        raw_data = GeoDistance::Input::File.get_file_content(file_path)
        raw_records = GeoDistance::Splitter::Character.split(raw_data, "\n")
        raw_records.map do |record|
          begin
            record_hash = JSON.parse(record)
            GeoDistance::Model::Customer.new(record_hash)
          rescue JSON::ParserError
            p "Parsing error occurred for row: #{record}"
            raise
          rescue ArgumentError
            p "Invalid data in row: #{record}"
            raise
          end
        end
      end

    end
  end
end
