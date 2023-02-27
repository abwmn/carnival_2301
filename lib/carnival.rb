class Carnival
  attr_reader :name, :duration, :rides
  @@total_carnival_revenue = 0

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.max_by do |ride| 
      ride.rider_log.values.sum
    end
  end

  def most_profitable_ride
    @rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def total_revenue
    total = 0
    @rides.each do |ride|
      total += ride.total_revenue
    end
    total
  end

  # def summary
  #   summary = Hash.new(0)
  #   visitors = Hash.new(0)
  #   summary[:revenue] = total_revenue
  #   @@total_carnival_revenue += total_revenue
  #   @rides.each do |ride| 
  #     summary[:visitor_count] += ride.rider_log.keys.length
  #     ride.rider_log.each do |visitor, times_ridden|
  #       visitors[visitor] = {
  #         :favorite_ride => [visitors[visitor][:favorite_ride], times_ridden].max,
  #         :total_spent =>
  #       }
  #     end
  #   end
  # end
end
