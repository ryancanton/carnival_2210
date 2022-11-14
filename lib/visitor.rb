class Visitor

  attr_reader :name,
              :height,
              :preferences

  def initialize(name, height, cash)
    @name = name
    @height = height
    @cash = cash
    @preferences = []
  end

  def spending_money
    @cash.delete('$').to_i
  end
end
