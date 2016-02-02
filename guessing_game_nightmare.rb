def check_guess?(answer, number)
  return answer == number
end

def get_lower_limit
  puts "Enter lowest possible number: "
  return gets.chomp.to_i
end

def get_upper_limit
  puts "Enter highest possible number: "
  return gets.chomp.to_i
end

def get_number_of_guesses
  puts "Enter number of guesses I can make: "
  return gets.chomp.to_i
end

def get_user_response
  puts "Is that correct? (0 = answer is lower, 1 = correct guess, 2 = answer is higher): "
  return gets.chomp.to_i
end

count_guesses = 0
puts "Would you like to play a game?\nPick a range of numbers and the number of guesses I can use and I will try guess your number."
lower_limit = get_lower_limit
upper_limit = get_upper_limit
while upper_limit < lower_limit
  puts "The highest possible number must actually be higher than the lowest number. Let's try that again"
  upper_limit = get_upper_limit
end
num_guesses = get_number_of_guesses
while num_guesses <= 0
  puts "I need at least 1 guess.  Lets try that again"
  num_guesses = get_number_of_guesses
end
begin
  my_range = (lower_limit..upper_limit).to_a
  my_guess = lower_limit + (upper_limit - lower_limit) / 2
  #check if only 1 number left in the array.  if there is then the computer has won
  if my_range.length == 1
    puts "Your number is #{my_range[0]} and it only took me #{count_guesses} guesses!"
    exit
  end
  puts "My guess is #{my_guess}."
  user_input = get_user_response
end
