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
    puts "Your guess is lower than the answer"
    if guess.to_i < max_guess && guess.to_i > min_guess
      min_guess = guess.to_i
    else
      puts "Your guess is also outside of the range you already established."
    end
  else
    puts "Your guess is higher than the answer"
    if guess.to_i < max_guess && guess.to_i > min_guess
      max_guess = guess.to_i
    else
      puts "Your guess is also outside of the range you already established."
    end
  end
  previous_guesses << guess.to_i
end
puts "The number was #{random_number} and you kinda suck at this"
