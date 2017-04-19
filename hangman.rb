class Hangman

def select_random_word
  @word = File.readlines("c://sites/hangman/5desk.txt").sample.to_s.chomp

  if @word.length == 4 || @word.length <= 12
    @word
  else select_random_word
  end

end

def startGame
  select_random_word
  @wordArray = @word.split("")
  @length = @word.length
  @hint = Array.new(@length){"_"}

  print "Let's play Hangman!\nYou have 6 chances to guess my word.\nHere is your hint: #{@hint}\nGive me a letter!"
  @letter = gets.chomp
checkGuess
end

def checkGuess

@hint = @wordArray.map! { |x|
 if x == @letter
   @letter
 else "_"
end }
print @hint.join(" ")
end

end

a = Hangman.new
puts a.startGame
