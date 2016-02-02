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


UPPERLIMIT = 100
num_guesses = 0
random_number = get_rand(UPPERLIMIT)
legal_number = false
begin
  begin
    guess = get_input
    legal_number = is_integer?
  end while !legal_number
  if check_guess?(random_number, guess)
  end
end while
