# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue TypeError
    return nil
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError
    puts "Me likes coffee but me really wants a fruit!"
    # maybe_fruit = gets.chomp
    retry if maybe_fruit == 'coffee'
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      raise ArgumentError.new "We're not that good of friends..." if yrs_known < 5
      raise ArgumentError.new "You need a name" if name.length <= 0
      raise ArgumentError.new "Why are you so boring? (add a passtime)" if fav_pastime.length <= 0
      @name = name
      @yrs_known = yrs_known
      @fav_pastime = fav_pastime
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
