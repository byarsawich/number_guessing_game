def get_rand(number)
  return (1..number).to_a.sample
end

def check_guess?(answer, number)
  return answer == number
end

def get_input(num)
  puts "Guess an integer between 1 and #{num}: "
  return gets.chomp
end

def is_integer?(value)
  return value.to_i.to_s == value.to_s
end

#returns true if guess is logical given previous information recieved
#returns fales if guess is a stupid guess
def check_against_previous?(answer, guess, previous_guesses)
  #if no previous guesses then return true
  if previous_guesses.length <= 0
    return true
  end
  return !((previous_guesses[-1] > answer && guess > previous_guesses[-1]) || (previous_guesses[-1] < answer && guess < previous_guesses[-1]))
end

UPPERLIMIT = 100
NUM_GUESSES = 5
random_number = get_rand(UPPERLIMIT)
legal_number = false
previous_guesses = Array.new
max_guess = UPPERLIMIT
min_guess = 1
for i in 1..NUM_GUESSES
  begin
    guess = get_input(UPPERLIMIT)
    legal_number = is_integer?(guess)
  end while !legal_number
  if check_guess?(random_number, guess.to_i)
    puts "Congrats on guessing that the number was #{guess} in #{i} guesses"
    exit
  elsif previous_guesses.include?(guess.to_i)
    puts "Because your guess wasn't already wrong the first time you guessed it.  Good job wasting a guess."
  elsif random_number > guess.to_i
    if guess.to_i < max_guess && guess.to_i > min_guess
      puts "Your guess is lower than the answer"
      min_guess = guess.to_i
    else
      puts "Are you even listening to what I'm saying.  Your previous guess was too low as well"
    end
  else
    if guess.to_i < max_guess && guess.to_i > min_guess
      puts "Your guess is higher than the answer"
      max_guess = guess.to_i
    else
      puts "Are you even listening to what I'm saying.  Your previous guess was too high as well"
    end
  end
  previous_guesses << guess.to_i
end
puts "The number was #{random_number} and you kinda suck at this"
