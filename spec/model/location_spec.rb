require 'rspec'

RSpec.describe GeoDistance::Model::Location do

  describe ".distance_to" do

    let(:start_point) { GeoDistance::Model::Location.new(53.339428, -6.257664) }
    let(:end_point) { GeoDistance::Model::Location.new(52.833502, -8.522366) }

    it 'should calculate correct distance' do
      expect(start_point.distance_to(end_point)).to eq 161362.07870696948
    end
  end

end
