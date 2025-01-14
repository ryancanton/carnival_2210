require './lib/ride'
require './lib/visitor'

RSpec.describe Ride do
  describe '#initialize' do
    it 'exists and has attributes' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

      expect(ride1).to be_a(Ride)
      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
    end
  end

  describe '#board_rider and #rider_log' do
    it 'adds visitor object to rider_log' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      expect(ride1.rider_log).to eq([visitor1, visitor2])
    end

    it 'increses total_revenue and decreases rider spending_money' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      expect(ride1.total_revenue).to eq(3)
      expect(visitor1.spending_money).to eq(8)
      expect(visitor2.spending_money).to eq(4)
    end

    it 'only adds riders who are tall enough to ride' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor3 = Visitor.new('Penny', 64, '$15')
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      ride3.board_rider(visitor1)
      ride3.board_rider(visitor3)

      expect(ride3.rider_log).to eq([visitor3])
    end
  end
end
