require 'rspec'

RSpec.describe GeoDistance::CLI do

  describe ".get_customers_in_radius" do

    context "valid parameters are provided" do
      let(:cli) { GeoDistance::CLI.new }
      let(:valid_customers_file_path) { "#{File.dirname(__FILE__)}/../fixtures/files/valid_customers.txt" }
      let(:valid_results) {
        # TODO: move to fixture
        [["Ian Kehoe", 4],
        ["Nora Dempsey", 5],
        ["Theresa Enright", 6],
        ["Eoin Ahearn", 8],
        ["Richard Finnegan", 11],
        ["Christina McArdle", 12],
        ["Olive Ahearn", 13],
        ["Michael Ahearn", 15],
        ["Patricia Cahill", 17],
        ["Eoin Gallagher", 23],
        ["Rose Enright", 24],
        ["Stephen McArdle", 26],
        ["Oliver Ahearn", 29],
        ["Nick Enright", 30],
        ["Alan Behan", 31],
        ["Lisa Ahearn", 39]]
      }
      let(:get_customers_in_radius) { cli.get_customers_in_radius(valid_customers_file_path, 53.339428, -6.257664, 100000)}

      it 'should find correct number of matching records' do
        expect(get_customers_in_radius.count).to eq 16
      end

      it 'should find records within 100 kms' do
        expect(get_customers_in_radius).to eq valid_results
      end
    end

    context "file with invalid data is provided" do
      let(:cli) { GeoDistance::CLI.new }
      let(:invalid_customers_file_path) { "#{File.dirname(__FILE__)}/../fixtures/files/invalid_customers.txt" }

      it 'should raise an error' do
        expect do
          cli.get_customers_in_radius(invalid_customers_file_path, 1, 1, 1)
        end.to raise_error(ArgumentError)
      end
    end

    context "unparsable file is provided" do
      let(:cli) { GeoDistance::CLI.new }
      let(:invalid_customers_file_path) { "#{File.dirname(__FILE__)}/../fixtures/files/invalid_json.txt" }

      it 'should raise an error' do
        expect do
          cli.get_customers_in_radius(invalid_customers_file_path, 1, 1, 1)
        end.to raise_error(JSON::ParserError)
      end
    end


    context "empty file is provided" do
      let(:cli) { GeoDistance::CLI.new }
      let(:empty_customers_file_path) { "#{File.dirname(__FILE__)}/../fixtures/files/empty.txt" }
      let(:get_customers_in_radius) { cli.get_customers_in_radius(empty_customers_file_path, 53.339428, -6.257664, 100000)}

      it 'should raise an error' do
        expect(get_customers_in_radius.count).to eq 0
      end
    end

  end

end
