require 'oystercard'

describe Oystercard do
  
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it 'returns balance' do
    expect(subject.balance).to eq(0)
  end
  
  it 'creates an instance of Oystercard' do
    expect(subject).to be_instance_of(Oystercard)
  end

  it 'it does not let you touch in if balance is less than min fare' do
    expect { subject.touch_in(entry_station) }.to raise_error('Insufficient balance')
  end
  
  describe '#add_money' do
    it 'does not allow user to add more than maximum funds' do
      subject.add_money(Oystercard::MAX_BALANCE)
      expect { subject.add_money(1) }.to raise_error("funds cannot be added: maximum balance £#{Oystercard::MAX_BALANCE}")
    end
  end

  it 'checks that the card has an empty list of journeys' do
    expect(subject.list_of_journeys).to be_empty
  end

  context 'Oystercard is already on a journey' do
    before(:each) { subject.add_money(Oystercard::MIN_FARE) }
    before(:each) { subject.touch_in(entry_station) }

    describe '#touch_in' do
      it 'when card touches in, Oyster has a current journey' do
        expect(subject.current_journey).not_to be_nil 
      end
    end

    describe '#touch_out' do

      context 'Oystercard touches out' do 
        before(:each) { subject.touch_out(exit_station) }

        it 'when card touches out, Oyster no longer has a journey' do  
          expect(subject.current_journey).to be_nil
        end

        it 'resets entry station to nil' do
          expect(subject.entry_station).to eq nil
        end

        it "Checks touching in and touching out creates a journey" do
          expect(subject.list_of_journeys).to include{"Journey: " => "#{entry_station} -> #{exit_station}"}
        end
          
        it "Checks that touching in and out creates one journey" do
          expect((subject.list_of_journeys).count).to eq 1
        end
      end
        
      
      it 'deducts fare from balance' do
        
        
        expect { subject.touch_out(exit_station)}.to change { subject.balance }.by(-Oystercard::MIN_FARE)
      end
    end
  end
end






# it 'allows user to touch in' do
#   expect(subject).to respond_to :touch_in
# end

# it 'allows user to touch out' do
# expect(subject).to respond_to :touch_out
# end
