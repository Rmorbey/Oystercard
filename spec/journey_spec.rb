require 'oystercard'
require 'station'
require 'journey'

describe Journey do
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :entry_station}
  
  it 'charges penalty fare when no touch in' do

  end


  context 'it starts a journey' do
    before(:each) { subject.start(entry_station) }

    it 'can start a journey' do
      expect(subject.entry_station).to eq entry_station
    end

    it 'it charges penalty fare when no touch out' do

    end

    it 'returns when a journey is not complete' do

    end
  
    context 'it ends the journey' do
      before(:each) { subject.end(exit_station) }

      it 'stores the exit station' do
        expect(subject.exit_station).eq exit_station
      end

      it 'can calculate fare for normal journey' do

      end

      it 'it returns when a journey is complete' do
        expect(subject.state).eq "complete"
      end
    end
  end
end


