require './spec/spec_helper'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new('Denver Public Carnival', 3)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:gentle)
    @visitor1.add_preference(:thrilling)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
  end

  it 'exists and has attributes' do
    expect(@carnival).to be_a(Carnival)
    expect(@carnival.name).to eq("Denver Public Carnival")
    expect(@carnival.duration).to eq(3)
  end

  it 'can add and list rides' do
    expect(@carnival.rides).to eq([])
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
  end

  it 'can calculate stats' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor3)
    @ride1.board_rider(@visitor1)

    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor3)

    @ride3.board_rider(@visitor1)
    
    expect(@carnival.most_popular_ride).to eq(@ride1)
    expect(@carnival.most_profitable_ride).to eq(@ride2)
    expect(@carnival.total_revenue).to eq(11)
  end
end