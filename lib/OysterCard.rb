class Oystercard

#We can access the balance by calling subject.balance
  attr_reader :balance
MAXIMUM_BALANCE = 90
#When creating a oystercard instance, the balance will be 0.
def initialize(balance = 0)
  @balance = balance
end
end
