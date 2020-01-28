require('time')
class DateParser
  attr_accessor :parsed_string
  @@months = {"janvier" => "01", "fevrier" => "02", "mars" => "03", "avril" => "04", "mai" => "05", "juin" => "06", "juillet" => "07", "aout" => "08", "septembre" => "09", "octobre" => "10", "novembre" => "11", "decembre" => "12"}
  def initialize(string)
    @parsed_string = test_match(string)
    
  end
  

  private
  def test_match(string)
    if match = string.match(/(?:le)?(?: )?([0-9]?[0-9])(?: |\/)([A-Za-zÀ-ÖØ-öø-ÿ]{3,9}|[0-9]?[0-9])(?: |\/)([0-9]{2,4})(?: )[aà](?: )?([0-9]?[0-9])(?: )?(?:h|H|heure|heures|hr|hrs)(?: )?([0-9]{0,2})(?: )?(?:mn|mns|minutes)?/)
      day, month, year, hour, minutes = match.captures
      return format_to_date_from_array([day, month, year, hour, minutes])
    else
    return nil
    end
  end
  def format_to_date_from_array(array)
    day = parse_day(array[0])
    month = parse_month(array[1])
    year = parse_year(array[2])
    hour = parse_hour(array[3])
    minutes = parse_minutes(array[4])
    p day
    p month
    p year
    p hour
    p minutes
    string = (year + '-' + month + '-' + day + ' ' + hour + ':' + minutes)
    return string
  end
 
  def parse_day(word)
    str = format('%02d', word)
    str
  end

  def parse_year(word)
    if word.length == 2
       string = "20" + word
       string
    else
      word
    end
  end

  def parse_month(word)
    word = remove_special_chars(word)
    @@months[word]
  end

  def parse_hour(word)
    format('%02d', word)
  end

  def parse_minutes(word)
    word
  end

  def remove_special_chars(str)
    str = str.tr(
      "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
      "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz")
    str
  end

  
end

