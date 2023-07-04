# answer word
# todo: find an API to generate random word
word = "world"

# getting user input and continuing until they enter a 5 letter word
puts "Please enter a guess:"
guess = gets.chomp.downcase

until guess.length == 5
  puts "Please enter a guess with 5 letters:"
  guess = gets.chomp.downcase
end

# splitting both input and word into arrays for comparison
word_arr = word.split("")
guess_arr = guess.split("")

# feedback to return to user letting them know what is correct
# KEY - incorrect = R correct = G correct but in wrong spot = Y
return_arr = []

# comparing arrays
guess_arr.each do |letter|
  word_arr.each do |letter1|
    if letter == letter1
      puts "I ran"
    end
  end
end
