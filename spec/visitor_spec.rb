require './lib/visitor'

RSpec.describe Visitor do
  describe '#initialize' do
    it 'exists and has attributes' do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      expect(visitor1).to be_a(Visitor)
      expect(visitor1.name).to eq("Bruce")
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
      expect(visitor1.preferences).to eq([])
    end
  end

  describe '#add_preference' do
    it 'adds a preference to preferences' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:water)

      expect(visitor1.preferences).to eq([:gentle, :water])
    end
  end

  describe '#tall_enough?' do
    it 'returns true if visitor height is >= given height' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')

      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
    end
  end

  describe '#pay_for_ride' do
    it 'decreses spending cash by the given amount' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.pay_for_ride(1)

      expect(visitor1.spending_money).to eq(9)
    end
  end
end
