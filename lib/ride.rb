class Ride
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement, 
              :total_revenue, 
              :rider_log

  def initialize(details, carnival=nil)
    @name = details[:name]
    @min_height = details[:min_height]
    @admission_fee = details[:admission_fee]
    @excitement = details[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    return false if visitor.height < @min_height ||
                    !visitor.preferences.include?(@excitement) ||
                    visitor.spending_money < @admission_fee

    @total_revenue += @admission_fee
    @rider_log[visitor] += 1
    visitor.rides_ridden[self.name] += 1
    visitor.spending_money -= @admission_fee
    visitor.total_spent += @admission_fee
    true
  end
end
