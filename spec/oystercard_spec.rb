require 'oystercard'

describe Oystercard do
  let(:start_station) { double(:start_station) }
  let(:end_station) { double(:end_station) }

  before(:each) do |test|
    unless test.metadata[:skip_top_up_touch_in]
      subject.top_up(Oystercard::FARE)
      subject.touch_in(start_station)
    end
  end

  it 'card should have a balance of 0 when created', :skip_top_up_touch_in do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'allows us to top up the card by a given value' do
      expect { subject.top_up 10 }.to change { subject.balance }.by 10
    end

    it 'should raise an error if you top_up beyond the limit', :skip_top_up_touch_in do
      expect { subject.top_up(Oystercard::TOP_UP_LIMIT + 1) }.to raise_error "top-up limit of £#{Oystercard::TOP_UP_LIMIT} reached"
    end
  end

  describe '#touch_in' do
    it 'should result in_journey to return true if balance is more than or equal to £1 (minimum balance)' do
      expect(subject.in_journey?).to be_truthy
    end

    it 'card should not be able to touch_in if balance is less than £1 (minimum balance)', :skip_top_up_touch_in do
      expect { subject.touch_in(start_station) }.to raise_error 'Insufficient balance to touch in'
    end

    it 'returns the entry station when we call the method entry_station' do
      expect(subject.entry_station).to eq(start_station)
    end
  end

  describe '#touch_out' do
    before(:each) do |test|
      subject.touch_out(end_station) unless test.metadata[:skip_touch_out]
    end

    it 'should result in_journey to return false when we touch_out' do
      expect(subject.in_journey?).to be_falsey
    end

    it 'balance should reduce by fare amount', :skip_touch_out do
      expect { subject.touch_out(end_station) }.to change { subject.balance }.by(-Oystercard::FARE)
    end

    it 'should forget the entry station' do
      expect(subject.entry_station).to be_nil
    end

    it 'returns the exit station when we call exit_station' do
      expect(subject.exit_station).to eq end_station
    end
  end

  describe '#journey_history' do
    it 'returns a empty array if no journeys have been made', :skip_top_up_touch_in do
      expect(subject.journey_history).to be_empty
    end

    it 'returns a entry and exit station for first journey' do
      subject.touch_out(end_station)
      expect(subject.journey_history[0]).to include(entry_station: start_station, exit_station: end_station)
    end

    it 'records multiple journeys', :skip_top_up_touch_in do
      2.times do
        subject.top_up(Oystercard::FARE)
        subject.touch_in(start_station)
        subject.touch_out(end_station)
      end
      expect(subject.journey_history.length).to eq 2
    end
  end
end
