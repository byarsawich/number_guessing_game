def get_rand(number)
  return rand(number)
end

def check_guess?(answer, number)
  return answer == number
end

def get_input()
  puts "Guess an integer between 1 and " + LIMIT.to_s + ": "
  return gets.chomp
end

def is_integer?(value)
  return value.to_i.to_s == value.to_s
end

def higher?(answer, number)
  return number > answer
end


UPPERLIMIT = 100
random_number = get_rand(UPPERLIMIT)
legal_number = false
guesses = Array.new
for i in 1..5
  begin
    guess = get_input
    legal_number = is_integer?(guess)
  end while !legal_number
  num_guesses += 1
  if check_guess?(random_number, guess)
    puts "Congrats on guessing that the number was #{guess}"
    exit
  elsif guesses.include?(guess)
    puts "Because your guess wasn't already wrong the first time you guessed it"
  elsif higher?(random_number,guess)
    puts "The answer is higher then your guess"
  else
    puts "The answer is lower then your guess"
  end
end
puts "The number was #{random_number} and you kinda suck at this"
