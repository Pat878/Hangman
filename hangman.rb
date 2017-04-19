class Hangman

def select_random_word
  @word = File.readlines("c://sites/hangman/5desk.txt").sample.to_s

  if @word.length == 4 || @word.length <= 12
    @word
  else select_random_word
  end

end

def startGame
  select_random_word

  @length = @word.length
  @hint = Array.new(@length){"_"}

  print "Let's play Hangman!\nYou have 6 chances to guess my word.\nHere is your hint: #{@hint}\nGive me a letter!"
  letter = gets.chomp
  @word.each_char { |chr| if letter == chr
    print "yes"
  end  }



end

end

a = Hangman.new
puts a.startGame
