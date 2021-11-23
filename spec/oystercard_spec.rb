require 'oystercard'

describe Oystercard do
  it 'card should have a balance' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'allows us to top up the card by a given value' do 
      expect { subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it 'should raise an error if you top_up beyond the limit' do
        expect { subject.top_up (Oystercard::TOP_UP_LIMIT + 1) }. to raise_error "top-up limit of £#{Oystercard::TOP_UP_LIMIT} reached"
    end

  end

  describe '#deduct' do 
    it 'should deduct the balance by a specified value' do 
      expect { subject.deduct }.to change { subject.balance }.by -Oystercard::FARE
    end
  end

  describe '#touch_in' do
      it 'should result in_journey to return true' do
        subject.touch_in
          expect(subject.in_journey).to be_truthy
      end
    end

    describe '#touch_out' do
      it 'should result in_journey to return false when we touch_out' do
        subject.touch_out
        expect(subject.in_journey).to be_falsey
      end

  end

end
