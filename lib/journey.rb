require_relative 'oystercard'

class Journey
  attr_reader :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(station = nil)
    @entry_station = station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    if complete?
      MINIMUM_FARE
    else
      PENALTY_FARE
    end
  end

  def complete?
    @entry_station != nil && @exit_station != nil
  end
end