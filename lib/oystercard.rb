class Oystercard
  attr_reader :balance, :in_journey
  TOP_UP_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 6
  
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "top-up limit of £#{TOP_UP_LIMIT} reached" if limit_exceeded?(amount)
    # the output in irb reads: "top-up limit of \xC2\xA390 reached (RuntimeError)"
    # puts works?
    @balance += amount
  end

  def deduct
    # Walkthrough has used deduct(amount)
    @balance -= FARE
  end

  def touch_in
    fail "Insufficient balance to touch in" if insufficient_funds?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def limit_exceeded?(amount)
    @balance + amount > TOP_UP_LIMIT
  end

  def insufficient_funds?
    @balance < MINIMUM_BALANCE  
  end

end
