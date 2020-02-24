require 'OysterCard'
describe Oystercard do

#Created a failing test for User Story 1: As a customer I want a balance on my card.
it 'can have a balance when initialized' do
  expect(subject.balance).to eq(0)
end
end
