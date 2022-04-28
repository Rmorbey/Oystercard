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
      @state = "complete"
    end

    def fare
      if @entry_station == nil || @exit_station == nil
        PENALTY_FARE
      else
        1
      end
    end

end