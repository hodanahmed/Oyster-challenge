require 'OysterCard'
describe Oystercard do

#Created a passing test for User Story 1: As a customer I want a balance on my card.
  it 'can have a balance when initialized' do
    expect(subject.balance).to eq(0)
  end
#Created a passing test for User Story 2: As I want to add money to my card.
  it 'can add money to the balance' do
    subject.top_up(30)
    expect(subject.balance).to eq(30)
  end

#Created a passing rspec test for User Story 3:I want a maximum limit (of £90) on my card.
  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up maximum_balance
    expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
  end
#Created passing rspec test for User Story 4: Ability to deduct money from card balance.
  it 'deducts an amount from the balance' do
      subject.top_up(20)
      expect{ subject.deduct 2}.to change{ subject.balance }.by -2
  end
#Created a failing test for User Story 5: In order to get through the barriers. I need to touch in and out.
  it 'can touch in' do
    subject.touch_in
    expect(subject.in_journey?).to eq(true)
  end

  it 'initially should not be in journey' do
    expect(subject).not_to be_in_journey
  end

  it 'can touch out' do
  end

  it 'can see if user is on a journey' do
  end

end
