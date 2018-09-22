module GeoDistance::Input
  class File
    class << self
      def get_file_content(path)
        IO.read(path)
      end
    end
  end
end
