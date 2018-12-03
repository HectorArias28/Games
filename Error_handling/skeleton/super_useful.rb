# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError => error
    puts error.message
    nil
rescue TypeError => error
    puts error.message 
    nil
rescue SyntaxError => error #doesn't work - error of :1 drawn before function begins
    puts error.message  
    nil
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
  guess_count = 0
  puts "Hello, I am a friendly monster. :)"
  begin
  
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  guess_count += 1
  reaction(maybe_fruit) 

  rescue StandardError => error
    if guess_count < 2 && maybe_fruit != "coffee"
      puts "Not a fruit the monster likes. To try again please try coffee."
      retry
    elsif maybe_fruit != "coffee"
      return nil 
    else 
      puts "It likes coffee! Not a fruit though."
      retry
    end
  end
end  

# PHASE 4
class BestFriend

  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    if yrs_known < 5
      raise(ArgumentError,"Sorry. Best friends must know each other at least 5 years.")   
    elsif fav_pastime.empty? || name.empty? 
      raise(ArgumentError,"Name and fav_pastime can't be empty.")
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

