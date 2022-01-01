require 'Date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday_sym, schedule_sym)
    day = case schedule_sym
          when :teenth then calculate_teenth_day(weekday_sym)
          else calculate_x_day(weekday_sym) { schedule_sym }
          end
    Date.civil(@year, @month, day)
  end

  private

  def calculate_teenth_day(weekday_sym)
    (13..19).each do |d|
      return d if Date.civil(@year, @month, d).send(sym_to_boolean(weekday_sym))
    end
  end

  def calculate_x_day(weekday_sym)
    index = case yield
            when :first  then 0
            when :second then 1
            when :third  then 2
            when :fourth then 3
            when :last
              get_all(weekday_sym).size == 4 ? 3 : 4
            end
    get_all(weekday_sym)[index].day
  end

  def get_all(weekday_sym)
    first_day = Date.civil(@year, @month, 1)
    (first_day...first_day.next_month).each_with_object([]) do |d, new_arr|
      new_arr << d if d.send(sym_to_boolean(weekday_sym))
    end
  end

  def sym_to_boolean(sym)
    sym.to_s + "?"
  end

end
