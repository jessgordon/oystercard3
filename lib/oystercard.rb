class Oystercard
  attr_reader :balance
  TOP_UP_LIMIT = 90
  def initialize
    @balance = 0
    @top_up_limit = TOP_UP_LIMIT
  end

  def top_up(amount)
    fail "top-up limit of £#{@top_up_limit} reached" if limit_exceeded?(amount)
    # the output in irb reads: "top-up limit of \xC2\xA390 reached (RuntimeError)"
    # puts works?
    @balance += amount
  end

  private

  def limit_exceeded?(amount)
    @balance + amount > TOP_UP_LIMIT
  end

end
