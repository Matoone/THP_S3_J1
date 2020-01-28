require_relative("lib/user.rb")
require_relative("lib/event.rb")
require_relative("lib/event_creator.rb")
require_relative("lib/date_parser.rb")

julie = User.new("julie@gmail.com", 34)

puts julie.age
puts julie.email
puts User.all

barbeuc = Event.new("2020-01-26 11:15", 2, "Super Barbecue géant", ["truc@machin.com", "bidule@chose.fr"])

barbeuc.to_s
barbeuc.postpone_24h

barbeuc.to_s

p barbeuc.is_soon?
p User.find_by_email("julie@gmail.com").age

def use_event_creator
  event = EventCreator.new
  
end
use_event_creator
#DateParser.new("le 07 janvier 2020 à 20H45")
#DateParser.test_match("le 07 janvier 2020 à 20H45")
