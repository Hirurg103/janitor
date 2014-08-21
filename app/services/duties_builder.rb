class DutiesBuilder
  attr_reader :turn, :from, :to, :duties, :persistent_duties

  def self.call(turn, from, to)
    new(turn, from, to).build_ongoing
  end

  def initialize(turn, from, to)
    @turn = turn
    @from = from
    @to = to
    @duties = []
  end

  def build_ongoing
    load_persistent

    return @duties if turn.members.none?

    index = 0
    (to_friday(from)..to_friday(to)).step(7).each do |some_friday|
      persistent_duty = persistent_duties[index]
      if persistent_duty.present? && persistent_duty.appointed_at == some_friday
        @duties << persistent_duty
        index += 1
      else
        @duties << build_duty(some_friday)
      end
    end

    @duties
  end

  private

  def load_persistent
    @persistent_duties = turn.duties.between from, to
  end

  def build_duty(some_friday)
    Duty.new(
      appointed_at: some_friday,
      obliged: obliged_at(some_friday)
    )
  end

  def to_friday(time)
    (time.beginning_of_week + 4.days).to_date
  end

  def obliged_at(some_friday)
    turn.members.at index_of_obliged_at(some_friday)
  end

  def index_of_obliged_at(some_friday)
    count_duties_to(some_friday) % @turn.members.count
  end

  def count_duties_to(some_friday)
    (some_friday - to_friday(@turn.members_changed_at)) / 7
  end
end
