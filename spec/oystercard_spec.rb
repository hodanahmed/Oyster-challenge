require 'OysterCard'
describe Oystercard do

  describe '#initialize' do
  #Created a passing test for User Story 1: As a customer I want a balance on my card.
    it 'can have a balance when initialized' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
  #Created a passing test for User Story 2: As I want to add money to my card.
    it 'can add money to the balance' do
      subject.top_up(30)
      expect(subject.balance).to eq(30)
    end
  end
  #Created a passing rspec test for User Story 3:I want a maximum limit (of £90) on my card.
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up maximum_balance
      expect{ subject.top_up 1 }.to raise_error("Maximum balance of #{maximum_balance} exceeded")
    end
  #describe '#deduct' do
  #Created passing rspec test for User Story 4: Ability to deduct money from card balance.
    #it 'deducts an amount from the balance' do
    #    subject.top_up(20)
    #    expect{ subject.deduct 2}.to change{ subject.balance }.by -2
  #  end
#  end
  describe '#touch_in' do
    let (:oyster) {Oystercard.new(50)}
  #Created a passing test for User Story 5: In order to get through the barriers. I need to touch in.
    it 'can touch in' do
      subject = Oystercard.new(10)
      subject.touch_in("x")
      expect(subject.in_journey?).to eq(true)
    end
    it 'initially should not be in journey' do
      expect(subject).not_to be_in_journey
    end
#Created passing test for User story 7: The minimum amount (£1) for a single journey.
    it 'raise an error if balance less than £1' do
      oyster = Oystercard.new(0.2)
      expect{ oyster.touch_in(:station) }.to raise_error 'You need to top up your oyster!'
    end
#Created failing test for User story 8: I need to know where I've travelled from. (entry station)
    it 'has an entry station' do
      oyster.touch_in("Holloway")
      expect(oyster.entry_station).to eq("Holloway")
    end
  end
  describe '#touch_out' do
    let (:oyster) {Oystercard.new(50)}
  #Created a passing test for User Story 6: In order to get through the barriers. I need to touch out.
    it 'can touch out' do
      subject = Oystercard.new(10)
      subject.touch_in("x")
      subject.touch_out
      expect(subject.in_journey?).to eq(false)
    end
    # User Story 7: Created a passing test for deducting money from touch out
    it 'deducts £1 for every journey' do
      subject.top_up(20)
      subject.touch_in("x")
      expect{ subject.touch_out}.to change{ subject.balance }.by -1
    end
#User Story 8: Entry station returns to nil
    it 'can return entry station to nil' do
      oyster.touch_out("x")
      expect(oyster.entry_station).to change(nil)
    end

    it 'can see if user is on a journey' do
      expect(subject).to respond_to(:in_journey)
    end
  end
end
