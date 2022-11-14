class Carnival

  attr_reader :duration,
              :rides

  def initialize(duration, rides)
    @duration = duration
    @rides = rides
  end

  def most_popular_ride
    @rides.max_by { |ride| ride.rider_log.count }
  end

  def most_profitable_ride
    @rides.max_by { |ride| ride.total_revenue }
  end
end
