require 'station'

describe Station do
  let(:station) { Station.new('Mile End', 2) }

  it 'has a name' do
    expect(station.name).to eq 'Mile End'
  end

  it 'has a zone' do
    expect(station.zone).to eq 2
  end
end
