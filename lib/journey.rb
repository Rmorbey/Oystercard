class Journey
  attr_reader :entry_station, :exit_station, :state
  PENALTY_FARE = 6

  def initialize
    @state = "incomplete"
  end

  def start(entry_station)
    @entry_station = entry_station
    self
  end

  def finish(exit_station)
    @exit_station = exit_station
    @state = "complete" unless @entry_station == nil
    end

    def fare
      @entry_station == nil || @exit_station == nil ? PENALTY_FARE : 1
    end

end