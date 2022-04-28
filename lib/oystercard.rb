class Oystercard
  attr_reader :balance, :entry_station, :list_of_journeys, :exit_station


  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(journey_class=Journey)
    @balance = 0
    # @entry_station = nil
    @list_of_journeys = []
    # @exit_station = nil
    @journey_class = journey_class
  end
  
  def add_money(money)
    check_if_max_balance_exceeded(money)
    @balance += money
  end

  
  def touch_in(entry_station)
    check_min_balance
    j = journey_class.new
    j.start(entry_station)
    # @entry_station = entry_station
  end
  
  def touch_out(exit_station)
    j.finish(exit_station)
    deduct_money(j.fare)
    # @exit_station = exit_station
    @list_of_journeys << j
    # @entry_station = nil
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
# hello


# def touch_in
#   raise 'You cannot touch in twice' if @on_journey.empty? != true
#   @on_journey.push "On Journey" if @on_journey.empty? == true
# end

# def touch_out
#   raise 'You cannot touch out without touching in' if @on_journey.empty? == true
#   @on_journey.pop if @on_journey.empty? != true
# end
