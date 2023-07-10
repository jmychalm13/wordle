require "spicy-proton"
require "colorize"
system "clear"
puts "Welcome to Wordle! Have fun".colorize(:magenta).colorize(:background => :light_blue)
puts "If the letters are green, they're in the right spot. If the letters are yellow, it's the right letter, but not in that spot. If it's red, it's totally wrong."

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
  return_arr = []
  # comparing arrays and returning result as array
  index = 0
  5.times do
    if word_arr[index] == guess_arr[index]
      return_arr << guess_arr[index].upcase.colorize(:green)
    elsif word_arr.include?(guess_arr[index])
      # something here to account for double-correct
      return_arr << guess_arr[index].upcase.colorize(:yellow)
    else
      return_arr << guess_arr[index].upcase.colorize(:red)
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
