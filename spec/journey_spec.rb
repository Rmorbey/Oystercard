require 'oystercard'
require 'station'
require 'journey'

describe Journey do
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :entry_station}
  
  it 'charges penalty fare when no touch in or out' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  context 'it ends a journey' do
    before(:each) { subject.finish(exit_station) }
    
    it 'outputs incomplete journey when touch out only' do
      expect(subject.state).to eq "incomplete"
    end

    it 'charges a penalty fare when no touch in' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  context 'it starts a journey' do
    before(:each) { subject.start(entry_station) }

    it 'can start a journey' do
      expect(subject.entry_station).to eq entry_station
    end

    it 'charges a penalty fare when no touch out' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns when a journey is not complete' do
      expect(subject.state).to eq "incomplete"
    end
  
    context 'it also ends the journey' do
      before(:each) { subject.finish(exit_station) }

      it 'stores the exit station' do
        expect(subject.exit_station).to eq exit_station
      end

      it 'can calculate fare for normal journey' do
        expect(subject.fare).to eq 1
      end

      it 'it returns when a journey is complete' do
        expect(subject.state).to eq "complete"
      end
    end
  end
end


