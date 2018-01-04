class Distance
  attr_reader :from_loc, :to_loc

  RAD_PER_DEG = Math::PI/180                      # PI / 180
  RKM = 6371                                      # Earth radius in kilometers
  DUBLIN_OFFICE_LAT_LON = [53.339428, -6.257664]  # Coordinates for Dublin office

  def initialize(lat, lon)
    @from_loc = [lat.to_f, lon.to_f]
    @to_loc = DUBLIN_OFFICE_LAT_LON
  end

  def calculate_distance
    # return 0 if @from_loc[0]

    dlat_rad = (@to_loc[0] - @from_loc[0]) * RAD_PER_DEG  # Delta, converted to rad
    dlon_rad = (@to_loc[1] - @from_loc[1]) * RAD_PER_DEG

    lat1_rad = @from_loc[0] * RAD_PER_DEG
    lat2_rad = @to_loc[0] * RAD_PER_DEG

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    RKM * c # Delta in kms
  end
end