require 'spec_helper'

describe "A movie", :type => :model do
  it "is a flop if the total gross is less than $50M" do
    movie = Movie.new(total_gross: 40000000.00)

    expect(movie.flop?).to be_a(TrueClass)
  end
  it "is not a flop if the total gross exceeds $50M" do
    movie = Movie.new(total_gross: 60000000.00)

    expect(movie.flop?).to be_a(FalseClass)
  end
end
