require 'journey'

describe Journey do
  describe '#in_journey?' do
    it 'returns true when journey is initialized'
      journey = Journey.new('Mile End')
      expect(journey.in_journey?).to be_truthy
    end
  end
end