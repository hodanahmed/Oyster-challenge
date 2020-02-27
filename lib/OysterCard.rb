class Oystercard

  #We can access the balance by calling subject.balance
  attr_accessor :balance, :in_journey, :maximum_balance, :MINIMUM_FARE, :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  #When creating a oystercard instance, the balance will be 0.
  def initialize(balance = 0)
    @balance = balance
    @in_journey
    @maximum_balance = MAXIMUM_BALANCE
  end
  #When using the method 'top_up', it adds the argument to the balance to equal
  # to the current balance. It returns nil so it doesn't confuse the user/test.
  def top_up(money)
    @money = money
    raise "Maximum balance of #{maximum_balance} exceeded"  if maximum
    @balance += money
    return
  end

  def touch_in(station)
    raise 'You need to top up your oyster!' if minimum
    @in_journey = true
    @entry_station = station
    return "You are currently in #{station}"
  end

  def touch_out
    @in_journey = false
    deduct
  end

  def in_journey?
    @in_journey
  end

  private

  def minimum
    @balance < MINIMUM_BALANCE
  end

  def maximum
    @balance + @money > MAXIMUM_BALANCE
  end

  def deduct(money = MINIMUM_FARE)
    @balance -= money
  end
end
