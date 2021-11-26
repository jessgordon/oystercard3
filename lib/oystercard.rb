require_relative 'journey'

class Oystercard
  attr_reader :balance, :journey_history, :journey

  TOP_UP_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    raise "top-up limit of £#{TOP_UP_LIMIT} reached" if limit_exceeded?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient balance to touch in' if insufficient_funds?
    deduct if @journey != nil
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey = Journey.new if @journey == nil
    @journey.finish(station)

    @journey_history << { 
      entry_station: @journey.entry_station,
      exit_station: @journey.exit_station
    }
    deduct
    @journey = nil
  end

  private

  def limit_exceeded?(amount)
    @balance + amount > TOP_UP_LIMIT
  end

  def insufficient_funds?
    @balance < MINIMUM_BALANCE
  end

  def deduct
    @balance -= @journey.fare
  end
end
