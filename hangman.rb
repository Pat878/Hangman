#I used this source to write the checkGuess method
#https://stackoverflow.com/questions/29636503/getting-the-indexes-of-duplicate-elements-in-arrays-ruby
require "yaml"

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
  @wrongLetters = []

  print "Let's play Hangman!\nYou have 8 chances to guess my word.\nHere is your hint: #{@hint}\nGive me a letter!"
  @letter = gets.chomp.downcase
  checkGuess
end

def checkGuess
@index = @wordArray.each_index.select { |i| @wordArray [i] == @letter }
if @index.empty? == true
  @wrongLetters.push(@letter)
  turn
else
@index.map {|x| @hint[x] = @letter}
end
  #@index = @wordArray.index(@letter)
  #if @wordArray.index(@letter) != nil
  #@hint[@index] = @letter
#end
print @hint.join(" ")
print "\nIncorrect guesses: #{@wrongLetters}"
saveGame
end

def checkWin
  if @hint.include?("_") == false
    print "\nYou win!"
    exit
    else
    print "\nGive me another letter!"
    @letter = gets.chomp.downcase
    checkGuess
  end
end

def turn
  @i ||= -1
  @i += 1

  #if @win != true
  #print "\nYou have #{7-@i} guesses left!\n"
  #end

  if @i == 7
  print "Game over!\n"
  print @wordArray.join()
  exit
else
  print "\nYou have #{7-@i} guesses left!\n"
  end

end

def saveGame
  print "Do you want to save your game and exit? Type Y or N"
  @save = gets.chomp.upcase

  if @save == "Y"
    File.open("saved-game.yaml", "w") do |file|
      file.write(YAML::dump(self)) #a or self?
      exit
    end
  elsif @save == "N"
    checkWin
  end
end

end

a = Hangman.new.startGame
