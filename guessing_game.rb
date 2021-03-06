def get_rand(number)
  return rand(number) + 1
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
guesses = Array.new
for i in 1..NUM_GUESSES
  begin
    guess = get_input(UPPERLIMIT)
    legal_number = is_integer?(guess)
  end while !legal_number
  if check_guess?(random_number, guess.to_i)
    puts "Congrats on guessing that the number was #{guess}"
    exit
  elsif guesses.include?(guess.to_i)
    puts "Because your guess wasn't already wrong the first time you guessed it"
  elsif random_number > guess.to_i
    puts "The answer is higher then your guess"
  else
    puts "The answer is lower then your guess"
  end
  guesses << guess.to_i
end
puts "The number was #{random_number} and you kinda suck at this"
