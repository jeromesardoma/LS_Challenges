def reverse_odd_words(input)
  words = input[0...-1]
  words.split.map.with_index do |word, index|
    index.odd? ? word.reverse : word
  end.join(" ") + "."
end

i = "whats the matter with kansas."
p reverse_odd_words i

