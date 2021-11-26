require_relative 'journey'

class Oystercard
  attr_reader :balance, :journey_history, :entry_station, :exit_station, :journey

  TOP_UP_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 6

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    raise "top-up limit of £#{TOP_UP_LIMIT} reached" if limit_exceeded?(amount)

    # the output in irb reads: "top-up limit of \xC2\xA390 reached (RuntimeError)"
    # puts works?
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient balance to touch in' if insufficient_funds?
    @journey = Journey.new(station)
    # @entry_station = station
    # @journey_history << { entry_station: station }
  end

  def touch_out(station)
    deduct
    @journey.finish(station)
    # @entry_station = nil
    # @exit_station = station
    # @journey_history[-1][:exit_station] = station
  end

  def in_journey?
    @entry_station.nil? ? false : true
  end

  private

  def limit_exceeded?(amount)
    @balance + amount > TOP_UP_LIMIT
  end

  def insufficient_funds?
    @balance < MINIMUM_BALANCE
  end

  def deduct
    # Walkthrough has used deduct(amount)
    @balance -= FARE
  end
end
