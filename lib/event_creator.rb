require_relative("event.rb")
require_relative('date_parser.rb')

class EventCreator
  def initialize
    arr = event_creator_menu
    event = Event.new(arr[0], arr[1], arr[2], arr[3])
    puts "Okay c'est noté, ton évènement a été créé!"
    event.to_s
  end

  def event_creator_menu
    title = ask_event_name
    date = ask_event_date
    duration = ask_event_duration
    attendees = ask_event_attendees
    attendees_array = attendees.split(';').map{|string| string.strip}

    [date, duration, title, attendees_array]
  end

  def ask_event_name
    title = ""
      puts "Hello, tu veux créer un évènement? \n Okay let's go!"
      puts "Quel est le nom de l'évènement?"
      print ">"
      title = gets.chomp.to_s
    while title.length < 3
      puts "Erreur: Le titre de ton évènement doit avoir au moins 3 caractères!"
      puts "Quel est le nom de l'évènement?"
      print ">"
      title = gets.chomp.to_s
    end
    title
  end

  def ask_event_date
    puts "Okay. Quand aura-t'il lieu?"
    print ">"
    event_date = gets.chomp
    while DateParser.new(event_date).parsed_string == nil
      puts "Entrée invalide. Essayez avec un format du genre: le 6 février 2020 à 20h30"
      event_date = gets.chomp
    end
    return DateParser.new(event_date).parsed_string
    
  end

  def ask_event_duration
    puts "Bien noté! Combien de temps va-t'il durer (en minutes) ?"
    print ">"
    duration = gets.chomp
    while duration.match?(/[0-9]+/) == false
      puts "Vous devez rentrer un nombre de minutes et pas n'importe quoi... Réessayez donc petit malin:"
      print ">"
      duration = gets.chomp
    end
    duration.to_i
  end

  def ask_event_attendees
    puts "Okay, et maintenant qui veux tu inviter? Balance leurs emails, séparés par un ;"
    print ">"
    gets.chomp
  end

end