require 'OysterCard'
describe Oystercard do

#Created a passing test for User Story 1: As a customer I want a balance on my card.
it 'can have a balance when initialized' do
  expect(subject.balance).to eq(0)
end
#Created a rspec test for User Story 2: As I want to add money to my card.
it 'can add money to the balance' do
    subject.top_up(30)
  expect(subject.balance).to eq(30)
end
end
