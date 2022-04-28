class Oystercard
  attr_reader :balance, :entry_station, :list_of_journeys, :exit_station, :current_journey


  MAX_BALANCE = 90
  MIN_FARE = 1


  def initialize()
    @balance = 0
    @list_of_journeys = []
    @current_journey = nil
  end
  
  def add_money(money)
    check_if_max_balance_exceeded(money)
    @balance += money
  end

  
  def touch_in(entry_station)
    check_min_balance
    @current_journey = Journey.new.start(entry_station)
  end
  
  def touch_out(exit_station)
    @current_journey.finish(exit_station)
    deduct_money(@current_journey.fare)
    @list_of_journeys << @current_journey
    @current_journey = nil
  end
  
  private 
  
  def check_min_balance
    fail 'Insufficient balance' if @balance < MIN_FARE
  end

  def deduct_money(money)
    @balance -= money
  end
  
  def check_if_max_balance_exceeded(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if @balance + money > MAX_BALANCE
  end
end

# Hi Russell