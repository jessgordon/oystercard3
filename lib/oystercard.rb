class Oystercard
  attr_reader :balance
  TOP_UP_LIMIT = 90
  FARE = 6
  def initialize
    @balance = 0
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

  private

  def limit_exceeded?(amount)
    @balance + amount > TOP_UP_LIMIT
  end

end
