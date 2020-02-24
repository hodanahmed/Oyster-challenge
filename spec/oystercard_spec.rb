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
it 'can deduct money from current balance' do
    subject.top_up(30)
    subject.deduct(20)
    expect(subject.balance).to eq(10)
end
end
