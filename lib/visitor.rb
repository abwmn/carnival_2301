class Visitor
  attr_reader :height, :name, :preferences
  attr_accessor :spending_money
  
  def initialize(name, height, money)
    @height = height
    @name = name
    @preferences = []
    @spending_money = money.gsub('$', '').to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_requirement)
    @height >= height_requirement
  end
end
