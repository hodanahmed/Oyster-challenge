class Oystercard
#We can access the balance by calling subject.balance
  attr_reader :balance

#When creating a oystercard instance, the balance will be 0.
def initialize(balance = 0)
  @balance = balance
end

#When using the method 'top_up', it adds the argument to the balance to equal
# to the current balance. It returns nil so it doesn't confuse the user/test.
def top_up(money)
  @balance += money
  return
end
end
