class Oystercard
  attr_reader :balance, :entry_station

  TOP_UP_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 6

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "top-up limit of £#{TOP_UP_LIMIT} reached" if limit_exceeded?(amount)

    # the output in irb reads: "top-up limit of \xC2\xA390 reached (RuntimeError)"
    # puts works?
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient balance to touch in' if insufficient_funds?

    @entry_station = station
  end

  def touch_out
    deduct
    @entry_station = nil
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
