require_relative 'oystercard'

class Journey
  attr_reader :entry_station, :exit_station
  def initialize(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end
end