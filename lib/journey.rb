require 'oystercard'

class Journey
  def initialize(station)
    @entry_station = station
  end
  
  def in_journey?
    @entry_station.nil? ? false : true
  end
end