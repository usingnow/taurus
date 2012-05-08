class NumberCounter < ActiveRecord::Base

  validates_presence_of :name, :date, :sequence
  validates_uniqueness_of :name

  def self.current_number(name)
    date = Time.now.strftime('%Y%m%d').to_s
    number_counter = NumberCounter.find_by_name(name)
    if number_counter
      if number_counter.date == date
        number_counter.sequence += 1
      else
        number_counter.date = date
        number_counter.sequence = 1
      end
    else
      number_counter = NumberCounter.new(:name => name, :date => date, :sequence => 1)
    end
    number_counter
  end
end
