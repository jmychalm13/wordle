require "spicy-proton"
require "colorize"
system "clear"
puts "Welcome to Wordle! Have fun".colorize(:magenta).colorize(:background => :light_blue)
puts "If you get a 'G' your letter is right and in the right spot, a 'Y' means it's correct but in the wrong spot, and a 'R' just means you're totally wrong."

word = Spicy::Proton.noun(length: 5)
puts word
word_arr = word.split("")

guesses = 5

# loop for 5 turns
until guesses == 0
  # getting user input and continuing until they enter a 5 letter word
  puts "Please enter a guess:"
  guess = gets.chomp.downcase
  # validating guess for length
  until guess.length == 5
    puts "Please enter a guess with 5 letters:"
    guess = gets.chomp.downcase
  end
  # splitting guess into array for camparison
  guess_arr = guess.split("")

  if guess_arr == word_arr
    puts "You win!!!!"
    break
  end
  # KEY - incorrect = R correct = G correct but in wrong spot = Y
  return_arr = []
  # comparing arrays and returning result as array
  index = 0
  5.times do
    if word_arr[index] == guess_arr[index]
      return_arr << "G"
    elsif word_arr.include?(guess_arr[index])
      # something here to account for double-correct
      return_arr << "Y"
    else
      return_arr << "R"
    end
    index += 1
  end

  guesses -= 1

  puts guess_arr.join(" ** ").upcase
  puts return_arr.join(" ** ")
  unless guesses == 1
    puts "You have #{guesses} guesses remaining."
  else
    puts "You only have 1 guess left. Make it count ; )"
  end
end

if guess_arr != word_arr
  puts "I'm sorry, you didn't win this time : ("
  puts "The correct answer was: #{word}"
  puts "Please play again."
end
