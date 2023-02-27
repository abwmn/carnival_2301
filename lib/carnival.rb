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

  def summary
    @@total_carnival_revenue += total_revenue
    
    summary = {
    :visitor_count: 0,
    :revenue: total_revenue,
    :visitors: {},
    :rides: {}
    }
    
    @rides.each do |ride| 
      summary[:visitor_count] += ride.rider_log.keys.length
      ride.rider_log.each do |visitor, _|
        summary[:visitors][visitor.name] = {
          :favorite_ride => visitor.rides_ridden.key(visitor.rides_ridden.values.max),
          :total_spent => visitor.total_spent
        }
      rider_names = []
      ride.rider_log.keys.each{|rider|rider_names << rider.name}
      summary[:rides][ride.name] = {
        :visitors => rider_names,
        :total_revenue => ride.total_revenue
      }
      end
    end
    summary
  end
end
