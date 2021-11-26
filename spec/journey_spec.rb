require 'journey'
require 'oystercard'

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
  
  describe '#fare' do
    it 'if journey has an entry and exit station returns minimum fare' do
      journey = Journey.new(start_station)
      journey.finish(end_station)

      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'if journey has only an exit station returns penalty fare' do
      journey = Journey.new
      journey.finish(end_station)

      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'if journey has only an exit station returns penalty fare' do
      journey = Journey.new(start_station)

      expect(journey.fare).to eq Journey::PENALTY_FARE
    end    
  end
end