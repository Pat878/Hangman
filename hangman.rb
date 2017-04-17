class Hangman

def select_random_word
  word = File.readlines("c://sites/hangman/5desk.txt").sample.to_s

if word.length == 4 || word.length <= 12
  puts word
else select_random_word
end

end

end

a = Hangman.new
puts a.select_random_word
