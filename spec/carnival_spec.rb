require './lib/ride'
require './lib/visitor'
require './lib/carnival'

RSpec.describe Carnival do
  describe '#initialize' do
    it 'exists and has attributes' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival = Carnival.new(12, [ride1, ride2, ride3])

      expect(carnival).to be_a(Carnival)
      expect(carnival.duration).to eq(12)
      expect(carnival.rides).to eq([ride1, ride2, ride3])
    end
  end

  describe '#most_popular_ride' do
    it 'returns the ride with the largest rider_log' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)
      ride3.board_rider(visitor3)
      carnival = Carnival.new(12, [ride1, ride2, ride3])

      expect(carnival.most_popular_ride).to eq(ride1)
    end
  end
end
