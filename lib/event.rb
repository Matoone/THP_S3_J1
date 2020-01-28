require('time')
class Event
  attr_accessor :start_date, :duration, :title, :attendees, :end_date
  def initialize(date_string, duration_int, title_string, attendees_array)
    @start_date = format_date(date_string)
    @duration = duration_int.to_i
    @title = title_string
    @attendees = attendees_array
    calculate_end_date
  end

  def calculate_end_date
    @end_date = @start_date + duration*60
  end

  def is_past?
    @start_date < Time.now
  end

  def is_future?
    !is_past?
  end

  def is_soon?
    is_future? && Time.now + 60*30 >= @start_date
  end

  def postpone_24h
    @start_date = start_date + 24*60*60
    calculate_end_date
    puts "Le barbecue a été décalé au lendemain, même heure."
  end

  def to_s
    puts "Cete évènement s'appelle #{@title}."
    puts "La date prévue est le #{@start_date.strftime("%d/%m/%Y à %H:%M:%S")}."
    puts "Cet évènement va durer #{@duration} minutes."
    puts "Les invités suivants sont attendus: #{@attendees.join(', ')}."
    puts "Cet évènement prend fin le #{@end_date.strftime("%d/%m/%Y à %H:%M:%S")}."
    puts is_past? ? "Cet évènement a dejà commencé." : "Cet évènement est à venir."
  end
  private
  def format_date(string)
    Time.parse(string)
  end

  
end