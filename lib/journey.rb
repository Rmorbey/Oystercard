class Journey
  attr_reader :entry_station, :exit_station, :state
  PENALTY_FARE = 6



  def start(entry_station)
    @entry_station = entry_station
    self
  end

  def finish(exit_station)
    @exit_station = exit_station
      @state = "complete"
    end

    def fare
        PENALTY_FARE
    end

end