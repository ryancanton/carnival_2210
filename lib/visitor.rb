class Visitor

  attr_reader :name,
              :height,
              :preferences,
              :spending_money

  def initialize(name, height, cash)
    @name = name
    @height = height
    @cash = cash
    @preferences = []
    @spending_money = cash.delete('$').to_i
  end

  def add_preference(preference)
    @preferences.push(preference)
  end

  def tall_enough?(height)
    @height >= height
  end

  def pay_for_ride(price)
    @spending_money -= price
  end
end
