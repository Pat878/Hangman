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
turn
end

def checkWin
end

def turn
  @i ||= -1
  @i += 1

  if @win != true
  print "You have #{5-@i} guesses left!\n"
  end

  if @i == 11
  print "Game over!\nHere's my code: #{@colorCode}"
  exit
  end

end

end

a = Hangman.new
puts a.startGame
