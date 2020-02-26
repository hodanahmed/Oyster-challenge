class Oystercard

#We can access the balance by calling subject.balance
  attr_accessor :balance, :in_journey, :maximum_balance
MAXIMUM_BALANCE = 90
#When creating a oystercard instance, the balance will be 0.
def initialize(balance = 0)
  @balance = balance
  @in_journey
  @maximum_balance = MAXIMUM_BALANCE
end
#When using the method 'top_up', it adds the argument to the balance to equal
# to the current balance. It returns nil so it doesn't confuse the user/test.
def top_up(money)
  raise 'Maximum balance of #{maximum_balance} exceeded' if @balance + money > MAXIMUM_BALANCE
  @balance += money
  return
end

def deduct(money)
  @balance -= money
  return
end

def touch_in
  @in_journey = true
end

def in_journey?
  @in_journey
end
end
