require 'journey'

describe Journey do
  let(:start_station) {double('entry_station')}
  let(:end_station) {double('exit_station')}
  describe '#initialize' do
    it 'records entry_station upon oystercard touch_in' do
      journey = Journey.new(start_station)
      expect(journey.entry_station).to eq(start_station)
    end
  end

  describe '#finish' do
    it 'records exit station upon oystercard touch_out' do
      journey = Journey.new(start_station)
      journey.finish(end_station)
      expect(journey.exit_station).to eq(end_station)
    end
  end
  
end