class Visitor
  attr_reader :height, :name, :preferences
  attr_accessor :spending_money, :total_spent, :rides_ridden

  def initialize(name, height, money)
    @height = height
    @name = name
    @preferences = []
    @spending_money = money.gsub('$', '').to_i
    @total_spent = 0
    @rides_ridden = Hash.new(0)
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_requirement)
    @height >= height_requirement
  end
end
