require 'distance'

describe Distance do
  describe '.calculate_distance' do
    it 'calculates distance between two valid coordinates value' do
      distance = Distance.new(
        52.986375, -6.043701
      ).calculate_distance

      expect(distance).to be > 0
    end

    it 'calculates distance between two invalid coordinates value' do
      distance = Distance.new(
        52.986375, ''
      ).calculate_distance

      expect(distance).to be > 0
    end
  end

  describe '.from_loc' do
    it "should check the presence of from_loc variable" do
      lat_lon = [52.986375, -6.043701]
      distance = Distance.new(lat_lon[0], lat_lon[1])

      expect(distance.from_loc).to be_a_kind_of(Array)
      expect(distance.from_loc[0]).to eq(lat_lon[0])
      expect(distance.from_loc[1]).to eq(lat_lon[1])
    end
  end
end